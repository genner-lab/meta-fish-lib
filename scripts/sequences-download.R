#!/usr/bin/env Rscript
# Rupert A. Collins

# R script to make reference databases for UK fishes for multiple markers
# downloads all mtDNA sequence data from GenBank/BOLD, for a provided list of species 

# load functions and libs
source(here::here("scripts","load-libs.R"))
# load up your personal NCBI API key to get 10 requests per sec. This needs to be generated from your account at https://www.ncbi.nlm.nih.gov/
# DO NOT PUT THIS KEY ON GITHUB
# if you don't have one, ncbi will rate-limit your access to 3 requests per sec, and errors may occur.
source(here("assets","ncbi-key.R"))

# get args
option_list <- list( 
    make_option(c("-q","--qlength"), type="numeric"),
    make_option(c("-t","--threads"), type="numeric"),
    make_option(c("-e","--exhaustive"), type="character")
#    make_option(c("-b","--bold"), type="character")
    )

# set args
opt <- parse_args(OptionParser(option_list=option_list,add_help_option=FALSE))

# opts if running line-by-line
#opt <- NULL
#opt$qlength <- 2000
#opt$threads <- 4
#opt$exhaustive <- "true"
#opt$bold <- "true"

# load up the species table
#species.table <- suppressMessages(read_csv(file=here("assets","species-table-testing.csv")))
species.table <- suppressMessages(read_csv(file=here("assets","species-table.csv")))
#
#species.table %<>% slice(1:20)#############################
# report
writeLines(paste0("\nSpecies table contains ",length(pull(species.table,speciesName))," species names"))

# check the GenBank data release number against the record of previous download
gb.version <- read.table("ftp://ftp.ncbi.nih.gov/genbank/GB_Release_Number")$V1
writeLines(paste0("\nGenBank is at version ",gb.version))

### Download all GenBank sequences for species in species table (including synonyms) with mtDNA
# make a query for genbank
range <- "40:20000" # includes mt genomes, no bigger

# choose exhaustive or simple search for number of strings to search
if(opt$exhaustive == "true") {
    gene.syns <- "(COI[ALL] OR 12S[ALL] OR 16S[ALL] OR rRNA[ALL] OR ribosomal[ALL] OR cytb[ALL] OR CO1[ALL] OR cox1[ALL] OR cytochrome[ALL] OR subunit[ALL] OR COB[ALL] OR CYB[ALL] OR mitochondrial[ALL] OR mitochondrion[ALL])"
} else if (opt$exhaustive == "false") {
    gene.syns <- "(mitochondrial[ALL] OR mitochondrion[ALL])"
} else stop(writeLines("'-e' value must be 'true' or 'false'."))

# make query
spp.list <- unique(c(pull(species.table,speciesName),pull(species.table,validName)))
query <- unlist(mapply(function(x) paste0("(",spp.list,"[ORGN] AND ",x," AND ",range,"[SLEN])"), gene.syns, SIMPLIFY=FALSE, USE.NAMES=FALSE))

# randomise the query
set.seed(42)
query <- sample(query,length(query))

# set n cores to parallel search in n threads
# cores=1 is the safest option, but more cores are faster if there are no errors
# do not try more than 10 cores (with api key)
# do not try more than 3 cores (without api key)
# important - try to run the search when server loads are lowest, i.e. at weekends or when the USA is not at work.
cores <- opt$threads

# break up into chunks
# longest query should be no larger than about 2000 chars - reduce chunk.size to get smaller queries
chunk.size.rentrez <- floor(opt$qlength/max(unlist(lapply(query,nchar))))
query.split  <- split(query, ceiling(seq_along(query)/chunk.size.rentrez))

# collapse into strings of n species per string
query.cat <- unname(sapply(query.split, paste, collapse=" OR "))
# get length
query.cat.max <- max(unlist(lapply(query.cat,nchar)))
#query.cat.max

# chunk queries over the n cores
queries.chunked  <- split(query.cat, ceiling(seq_along(query.cat)/cores))

# stop if chars too few
if(opt$qlength < min(unlist(lapply(query,nchar)))) {
    stop(writeLines(paste("\nYou requested max batch query string length of",opt$qlength,"characters, but the smallest query is",min(unlist(lapply(query,nchar))),"characters. Increase the max batch query string length '-q'.")))
}

# stop if too many cores
if(length(query.split) < cores) {
    stop(writeLines(paste("\nYou requested",length(query.split),"batches over",cores,"cores. Use equal or fewer cores to number of batches, or decrease the batch query string length '-q'.")))
}

# run NCBI search and time
writeLines(paste0("\nA total of ",length(query)," queries have been merged into ",length(query.split)," batches with maximum length ",opt$qlength,"."))
writeLines(paste("\nNow searching GenBank on",cores,"cores ...\n"))
    start_time <- Sys.time()
search.res <- lapply(queries.chunked,entrez_search_parallel,threads=cores,key=ncbi.key)
    end_time <- Sys.time()

# flatten the searches
search.flat <- search.res %>% purrr::flatten() %>% unname()

# check for search length errors
if(length(search.flat) != length(query.cat)) {
    query.diff <- length(query.cat)-length(search.flat)
    stop(writeLines(paste0("\n",query.diff," query batches failed out of total ",length(query.cat),". Try again with fewer cores or decrease the max batch query string length '-q'.")))
    } else {writeLines("\nAll search batches retrieved.")
}

# check for errors - should be all false
if(TRUE %in% grepl("Error",search.res)) {
    stop(writeLines("\nSome of the search batches failed, try again with fewer cores or when the USA is not online."))
    } else {writeLines("\nNo errors detected in the batch searches.\n")
}

# report time
end_time-start_time

# remove empty searches
search.full <- search.flat[which(search.flat %>% purrr::map(~{unname(.x$count)}) > 0)]

# check number of hits
if(search.flat %>% purrr::map(~{unname(.x$count)}) %>% purrr::flatten_int() %>% max() > 99999){
    stop(writeLines("One or more of your search batches comprises more hits than the NCBI limit (99999). Consider decreasing the max batch query string length '-q', or making the searches more specific (e.g. searching for genera rather than families)."))
    }

# delete temp dir contents (if left from prev fail)
invisible(file.remove(list.files(here("temp","fasta-temp"),full.name=TRUE)))

# recreate dir if needed
if(!dir.exists(here("temp","fasta-temp"))){
    dir.create(here("temp","fasta-temp"))
}

# download
writeLines(paste("\nNow downloading",length(search.full),"batches of FASTA sequences from NCBI ...\n"))
start_time <- Sys.time()
    invisible(mcmapply(FUN=function(x) entrez_fetch_parallel(search=x,key=ncbi.key), search.full, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores))
end_time <- Sys.time()

# check number downloaded correctly
if(length(list.files(here("temp","fasta-temp"))) != length(search.full)) {
    dl.diff <- length(search.full) - length(list.files(here("temp","fasta-temp")))
    stop(writeLines(paste0("\n",dl.diff," download batches failed out of total ",length(search.full),". Try again with fewer cores or when the USA is not online.")))
    } else {writeLines("\nNo errors detected in the NCBI downloads.\n")
}
# report time
end_time-start_time

# read in the files and cat
all.fas <- mcmapply(FUN=function(x) read.FASTA(x), list.files(here("temp","fasta-temp"),full.name=TRUE), SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores)
all.fas.cat <- do.call(c,all.fas)

# edit names
names(all.fas.cat) <- str_replace_all(names(all.fas.cat)," .*","")

# write out
writeLines("\nWriting out in FASTA format ...")
write.FASTA(all.fas.cat,file=here("temp","mtdna-dump.fas"))

# delete temp folder contents (if left from prev fail)
invisible(file.remove(list.files(here("temp","fasta-temp"),full.name=TRUE)))


### Now repeat the same for the BOLD database

# turn on bold option
#if(opt$bold == "true") {

writeLines("\nNow searching BOLD ...\n")

# randomise the query
set.seed(42)
spp.list.sam <- sample(spp.list)

# set max length of query
chunk.size.bold <- floor(4500/mean(unlist(lapply(spp.list.sam,nchar)))) # 5000 chars is 260 species per chunk and 17 chunks
bold.split <- split(spp.list.sam, ceiling(seq_along(spp.list.sam)/chunk.size.bold))
#lens <- unlist(lapply(bold.split,function(x) nchar(paste(x,collapse=""))))
#hist(unlist(lapply(bold.split,function(x) nchar(paste(x,collapse="")))))

# query BOLD and retrieve a table
# sometimes an error occurs, just run again
# taxize::bold_ping(verbose = TRUE)
    start_time <- Sys.time()
bold.all <- mcmapply(FUN=function(x) bold_seqspec_timer(species=x), bold.split, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores)
    end_time <- Sys.time()
    end_time-start_time

# check for errors (should be "data.frame" or "logical", not "character")
if(length(which(sapply(bold.all,class) == "data.frame" | sapply(bold.all,class) == "logical")) == length(sapply(bold.all,class))) {
    writeLines("\nBOLD results successfully retrieved.")
    } else {stop(writeLines("\nBOLD search failed, try again."))}

# remove the NA non-dataframes
bold.all <- bold.all[which(sapply(bold.all, class)=="data.frame")]

# tidy it up and join it together, remove duplicate records
bold.red <- lapply(lapply(bold.all, as_tibble), function(x) mutate_all(x,as.character))
bold.red <- bind_rows(bold.red)
bold.red %<>% 
    mutate(nucleotides=str_replace_all(nucleotides,"-",""), nucleotides=str_replace_all(nucleotides,"N",""), num_bases=nchar(nucleotides)) %>% 
    filter(num_bases > 0) %>%
    filter(institution_storing!="Mined from GenBank, NCBI") %>% 
    mutate(processidUniq=paste(processid,markercode,sep=".")) %>% 
    distinct(processidUniq, .keep_all=TRUE)

# write temp copy of the bold dump
write_csv(bold.red,file=here("temp","bold-dump.csv"))

# create a fasta file of BOLD
bold.fas <- tab2fas(df=bold.red,seqcol="nucleotides",namecol="processidUniq")

# add it to the GenBank file already created
write.FASTA(bold.fas, file=here("temp","mtdna-dump.fas"), append=TRUE)


# close bold option
#} else if (opt$bold == "false") {
#    # dummy bold table
#    bold.red <- tibble(
#        processid=NA,sampleid=NA,recordID=NA,catalognum=NA,fieldnum=NA,institution_storing=NA,collection_code=NA,bin_uri=NA,phylum_taxID=NA#,phylum_name=NA,class_taxID=NA,class_name=NA,order_taxID=NA,order_name=NA,family_taxID=NA,family_name=NA,subfamily_taxID=NA,#subfamily_name=NA,genus_taxID=NA,genus_name=NA,species_taxID=NA,species_name=NA,subspecies_taxID=NA,subspecies_name=NA,#identification_provided_by=NA,identification_method=NA,identification_reference=NA,tax_note=NA,voucher_status=NA,tissue_type=NA#,collection_event_id=NA,collectors=NA,collectiondate_start=NA,collectiondate_end=NA,collectiontime=NA,collection_note=NA,#site_code=NA,sampling_protocol=NA,lifestage=NA,sex=NA,reproduction=NA,habitat=NA,associated_specimens=NA,associated_taxa=NA,#extrainfo=NA,notes=NA,lat=NA,lon=NA,coord_source=NA,coord_accuracy=NA,elev=NA,depth=NA,elev_accuracy=NA,depth_accuracy=NA,#country=NA,province_state=NA,region=NA,sector=NA,exactsite=NA,image_ids=NA,image_urls=NA,media_descriptors=NA,captions=NA,#copyright_holders=NA,copyright_years=NA,copyright_licenses=NA,copyright_institutions=NA,photographers=NA,sequenceID=NA,#markercode=NA,genbank_accession=NA,nucleotides=NA,trace_ids=NA,trace_names=NA,trace_links=NA,run_dates=NA,sequencing_centers=NA#,directions=NA,seq_primers=NA,marker_codes=NA,num_bases=NA,processidUniq=NA
#    )
## write out dummy file
#write_csv(bold.red,file=here("temp","bold-dump.csv"))
#
#} else stop(writeLines("'-b' value must be 'true' or 'false'."))


### report a summary table
stats <- tibble(
    stat=c("speciesTotal","speciesValid","speciesSynonyms","genbankVersion","date","uniqueQueries","maxBatchLength","numberBatches","cores","batchesPerCore","maxRecordsByBatch","totalRecordsGenbank","totalRecordsBold"),
    n=c(species.table %>% distinct(speciesName) %>% nrow(),#speciesTotal
        species.table %>% filter(status == "accepted name") %>% distinct(speciesName) %>% nrow(),#speciesValid
        species.table %>% filter(status != "accepted name") %>% distinct(speciesName) %>% nrow(),#speciesSynonyms
        gb.version,#genbankVersion
        format(Sys.time(), '%d %b %Y'),#date
        length(query),#uniqueQueries
        opt$qlength,#maxQueryLength
        length(query.cat),#numberBatches
        cores,#cores
        length(queries.chunked),#batchesPerCore
        search.flat %>% purrr::map(~{unname(.x$count)}) %>% purrr::flatten_int() %>% max(),#maxRecordsByBatch
        search.flat %>% purrr::map(~{unname(.x$count)}) %>% purrr::flatten_int() %>% sum(),#totalRecordsGenbank
        length(pull(bold.red,processidUniq))#totalRecordsBold
        )
)

# print and save
writeLines("\nPrinting stats ...\n")
print(stats,n=Inf)
write_csv(stats,file=here("reports","stats.csv"))
writeLines("\nAll operations completed!\nPlease read previous messages in case of error.")
