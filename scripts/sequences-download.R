#!/usr/bin/env Rscript
# Rupert A. Collins

# R script to make reference databases for UK fishes for multiple markers
# downloads all mtDNA sequence data from GenBank/BOLD, for a provided list of species 

# load functions and libs
source(here::here("scripts/load-libs.R"))
# load up your personal NCBI API key to get 10 requests per sec. This needs to be generated from your account at https://www.ncbi.nlm.nih.gov/
# DO NOT PUT THIS KEY ON GITHUB
# if you don't have one, ncbi will rate-limit your access to 3 requests per sec, and errors may occur.
source(here("assets/ncbi-key.R"))

# get args
option_list <- list( 
    make_option(c("-q","--qlength"), type="numeric"),
    make_option(c("-t","--threads"), type="numeric"),
    make_option(c("-e","--exhaustive"), type="character"),
    make_option(c("-b","--bold"), type="character")
    )

# set args
opt <- parse_args(OptionParser(option_list=option_list,add_help_option=FALSE))

# opts if running line-by-line
#opt <- NULL
#opt$qlength <- 500
#opt$threads <- 1
#opt$exhaustive <- "false"
#opt$bold <- "false"

# load up the species table
species.table <- read_csv(file=here("assets/species-table.csv"),show_col_types=FALSE)
#
#species.table %<>% slice(1:20)#############################
# report
cli_report(txt=glue::glue("Species table contains {length(pull(species.table,speciesName))} species names."),rule=FALSE,alert="info")


# check the GenBank data release number against the record of previous download
gb.version <- read.table("https://ftp.ncbi.nih.gov/genbank/GB_Release_Number")$V1
cli_report(txt=glue::glue("GenBank is at version {gb.version}."),rule=FALSE,alert="info")

### Download all GenBank sequences for species in species table (including synonyms) with mtDNA
# make a query for genbank
range <- "40:20000" # includes mt genomes, no bigger

# choose exhaustive or simple search for number of strings to search
if(opt$exhaustive == "true") {
    gene.syns <- "(COI[ALL] OR 12S[ALL] OR 16S[ALL] OR rRNA[ALL] OR ribosomal[ALL] OR cytb[ALL] OR CO1[ALL] OR cox1[ALL] OR cytochrome[ALL] OR subunit[ALL] OR COB[ALL] OR CYB[ALL] OR mitochondrial[ALL] OR mitochondrion[ALL])"
} else if (opt$exhaustive == "false") {
    gene.syns <- "(mitochondrial[ALL] OR mitochondrion[ALL])"
} else stop(cli::cli_alert_danger("'-e' value must be 'true' or 'false'."))

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
    stop(cli::cli_alert_danger(glue::glue("You requested max batch query string length of {opt$qlength} characters, but the smallest query is {min(unlist(lapply(query,nchar)))} characters. Increase the max batch query string length '-q'.")))
}

# stop if too many cores
if(length(query.split) < cores) {
    stop(cli::cli_alert_danger(glue::glue("You requested {length(query.split)} batches over {cores} cores. Use equal or fewer cores to number of batches, or decrease the batch query string length '-q'.")))
}

# run NCBI search and time
cli_report(txt=glue::glue("A total of {length(query)} queries have been merged into {length(query.split)} batches with maximum length {opt$qlength}."),rule=FALSE,alert="info")
cli_report(txt=glue::glue("Now searching GenBank on {cores} cores ..."),rule=FALSE,alert="info")

    start_time <- Sys.time()
search.res <- lapply(queries.chunked,entrez_search_parallel,threads=cores,key=ncbi.key)
    end_time <- Sys.time()

# flatten the searches
search.flat <- search.res %>% purrr::flatten() %>% unname()

# check for search length errors
if(length(search.flat) != length(query.cat)) {
    query.diff <- length(query.cat)-length(search.flat)
    stop(cli::cli_alert_danger(glue::glue("{query.diff} query batches failed out of total {length(query.cat)}. Try again with fewer cores or decrease the max batch query string length '-q'.")))
    } else { cli_report(txt="All search batches retrieved.",rule=FALSE,alert="success")
}

# check for errors - should be all false
if(TRUE %in% grepl("Error",search.res)) {
    stop(cli::cli_alert_danger("Some of the search batches failed, try again with fewer cores or when the USA is not online."))
    } else {cli_report(txt="No errors detected in the batch searches.",rule=FALSE,alert="success")
}

# report time
cli_report(txt=glue::glue("Total time taken: {round(as.numeric(end_time-start_time,units='mins'),digits=2)} minutes."),rule=FALSE,alert="info")

# remove empty searches
search.full <- search.flat[which(search.flat %>% purrr::map(~{unname(.x$count)}) > 0)]

# check number of hits
if(search.flat %>% purrr::map(~{unname(.x$count)}) %>% purrr::flatten_int() %>% max() > 99999){
    stop(cli::cli_alert_danger("One or more of your search batches comprises more hits than the NCBI limit (99,999). Consider decreasing the max batch query string length '-q', or making the searches more specific (e.g. searching for genera rather than families)."))
    }

# delete temp dir contents (if left from prev fail)
invisible(file.remove(list.files(here("temp/fasta-temp"),full.name=TRUE)))

# recreate dir if needed
if(!dir.exists(here("temp/fasta-temp"))){
    dir.create(here("temp/fasta-temp"))
}

# download
cli_report(txt=glue::glue("Now downloading {length(search.full)} batches of FASTA sequences from NCBI ..."),rule=FALSE,alert="info")
start_time <- Sys.time()
    invisible(mcmapply(FUN=function(x) entrez_fetch_parallel(search=x,key=ncbi.key), search.full, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores))
end_time <- Sys.time()

# check number downloaded correctly
if(length(list.files(here("temp","fasta-temp"))) != length(search.full)) {
    dl.diff <- length(search.full) - length(list.files(here("temp","fasta-temp")))
    stop(cli::cli_alert_danger(glue::glue("{dl.diff} download batches failed out of total {length(search.full)}. Try again with fewer cores or when the USA is not online.")))
    } else {cli_report(txt="No errors detected in the NCBI downloads.",rule=FALSE,alert="success")
}
# report time
cli_report(txt=glue::glue("Total time taken: {round(as.numeric(end_time-start_time,units='mins'),digits=2)} minutes."),rule=FALSE,alert="info")

# read in the files and cat
all.fas <- mcmapply(FUN=function(x) read.FASTA(x), list.files(here("temp/fasta-temp"),full.name=TRUE), SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores)
all.fas.cat <- do.call(c,all.fas)

# edit names
names(all.fas.cat) <- str_replace_all(names(all.fas.cat)," .*","")

# write out
cli_report(txt="Writing out in FASTA format ...",rule=FALSE,alert="info")
write.FASTA(all.fas.cat,file=here("temp/mtdna-dump.fas"))

# delete temp folder contents (if left from prev fail)
invisible(file.remove(list.files(here("temp/fasta-temp"),full.name=TRUE)))


### Now repeat the same for the BOLD database

# turn on bold option
if(opt$bold == "true") {
cli_report(txt="Now searching BOLD ...",rule=FALSE,alert="info")

# randomise the query
set.seed(42)
spp.list.sam <- sample(spp.list)

# set max length of query
chunk.size.bold <- floor(4000/mean(unlist(lapply(spp.list.sam,nchar)))) # 4000 chars is 200 species per chunk and 21 chunks
bold.split <- split(spp.list.sam, ceiling(seq_along(spp.list.sam)/chunk.size.bold))
#lens <- unlist(lapply(bold.split,function(x) nchar(paste(x,collapse=""))))
#hist(unlist(lapply(bold.split,function(x) nchar(paste(x,collapse="")))))

# query BOLD and retrieve a table
# sometimes an error occurs, just run again
# taxize::bold_ping(verbose = TRUE)
    start_time <- Sys.time()
bold.all <- mcmapply(FUN=function(x) bold_seqspec_timer(species=x), bold.split, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores)
    end_time <- Sys.time()
 cli_report(txt=glue::glue("Total time taken: {round(as.numeric(end_time-start_time,units='mins'),digits=2)} minutes."),rule=FALSE,alert="info")

# check for errors (should be "data.frame" or "logical", not "character")
if(length(which(sapply(bold.all,class) == "data.frame" | sapply(bold.all,class) == "logical")) == length(sapply(bold.all,class))) {
    cli_report(txt="BOLD results successfully retrieved.",rule=FALSE,alert="success")
    } else {stop(cli::cli_alert_danger("BOLD search failed, try again."))}

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
write_csv(bold.red,file=here("temp/bold-dump.csv"))

# create a fasta file of BOLD
bold.fas <- tab2fas(df=bold.red,seqcol="nucleotides",namecol="processidUniq")

# add it to the GenBank file already created
write.FASTA(bold.fas, file=here("temp/mtdna-dump.fas"), append=TRUE)


# close bold option
} else if (opt$bold == "false") {
#    rm bold table
    if (file.exists(here("temp/bold-dump.csv"))) {
         invisible(file.remove(here("temp/bold-dump.csv")))
    }
# dummy for stats
bold.red <- tibble(processidUniq=numeric())
# length(pull(bold.red,processidUniq))
#
} else stop(cli_alert_danger("'-b' value must be 'true' or 'false'."))


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
cli_report(txt="Printing stats ...",rule=FALSE,alert="info")
stats %>% knitr::kable()
write_csv(stats,file=here("reports/stats.csv"))
cli_report(txt="All operations completed. Please read previous messages in case of error.",rule=TRUE,alert="success")
