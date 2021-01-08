#!/usr/bin/env Rscript
# Rupert A. Collins

# R script to make reference databases for UK fishes for multiple markers
# downloads all mtDNA sequence data from GenBank/BOLD, for a provided list of species 

# load functions and libs
source("scripts/load-libs.R")
# load up your personal NCBI API key to get 10 requests per sec. This needs to be generated from your account at https://www.ncbi.nlm.nih.gov/
# DO NOT PUT THIS KEY ON GITHUB
# if you don't have one, ncbi will rate-limit your access to 3 requests per sec, and errors may occur.
source("assets/ncbi-key.R")


# load up the species table
species.table <- suppressMessages(read_csv(file="assets/species-table.csv"))
# report
writeLines(paste0("\nSpecies table contains ",length(pull(species.table,speciesName))," species names"))

# check the GenBank data release number against the record of previous download
gb.version <- read.table("ftp://ftp.ncbi.nih.gov/genbank/GB_Release_Number")$V1
writeLines(paste0("\nGenBank is at version ",gb.version))

### Download all GenBank sequences for species in species table (including synonyms) with mtDNA
# make a query for genbank
range <- "40:20000" # includes mt genomes, no bigger
gene.syns <- c("COI","12S","16S","rRNA","ribosomal","cytb","CO1","cox1","cytochrome","subunit","COB","CYB","mitochondrial","mitochondrion")
spp.list <- unique(c(pull(species.table,speciesName),pull(species.table,validName)))
query <- unlist(mapply(function(x) paste0("(",spp.list,"[ORGN] AND ",x,"[ALL] AND ",range,"[SLEN])"), gene.syns, SIMPLIFY=FALSE, USE.NAMES=FALSE))

# randomise the query
set.seed(42)
query <- sample(query,length(query))
query <- query[1:100]

# set n cores to parallel search in n threads
# cores=1 is the safest option, but more cores are faster if there are no errors
# do not try more than 10 cores (with api key)
# do not try more than 3 cores (without api key)
# important - try to run the search when server loads are lowest, i.e. at weekends or when the USA is not at work.
# should take about 1.5 h with 4 cores
cores <- 4

# break up into chunks
# longest query should be no larger than about 2500 chars - reduce chunk.size to get smaller queries
chunk.size.rentrez <- 35
query.split  <- split(query, ceiling(seq_along(query)/chunk.size.rentrez))

# collapse into strings of n species per string
query.cat <- unname(sapply(query.split, paste, collapse=" OR "))

# chunk queries over the n cores
queries.chunked  <- split(query.cat, ceiling(seq_along(query.cat)/cores))

# run NCBI search and time
writeLines(paste("\nNow searching GenBank on",cores,"cores ...\n"))
    start_time <- Sys.time()
search.res <- lapply(queries.chunked,entrez_search_parallel,threads=cores,key=ncbi.key)
    end_time <- Sys.time()
    end_time-start_time

# check for errors - should be all false
if(TRUE %in% grepl("Error",search.res)) {
    writeLines("\nSome of the searches failed, try again with fewer cores or when the USA is not online")
    } else {writeLines("\nAll search batches successful")
}

# flatten the searches
search.flat <- search.res %>% purrr::flatten()

# get the ids out the the non-zero results
search.ids <- search.flat[which(search.flat %>% purrr::map(~{unname(.x$count)}) > 0)] %>% purrr::map(~{unname(.x$ids)}) %>% purrr::flatten_chr() %>% unique()


### now download ids using ape
# chunk up into 70s to stop server from rejecting request 
chunk.size.ape <- 70
id.split <- unname(split(search.ids, ceiling(seq_along(search.ids)/chunk.size.ape)))

# download with modifed ape function (fast)
writeLines(paste("\nNow downloading",length(search.ids),"sequences from GenBank ..."))
ncbi.all <- mcmapply(FUN=function(x) read_GenBank(x, species.names=FALSE, api.key=ncbi.key), id.split, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores)

# check for errors (should be all DNAbin)
if(length(sapply(ncbi.all, class)) == length(sapply(ncbi.all, class) == "DNAbin")) {
    writeLines("\nAll sequences sucessfully downloaded")
    } else {writeLines("\nDownload failed, try again with fewer cores or when the USA is not online")}

# write out a temporary file
writeLines("\nWriting out in FASTA format ...")
suppressMessages({
    file.create("temp/mtdna-dump.fas")
    invisible(lapply(ncbi.all, write.FASTA, file="temp/mtdna-dump.fas", append=TRUE))
})


### Now repeat the same for the BOLD database

writeLines("\nNow searching BOLD ...")

# chunk up the BOLD requests
chunk.size.bold <- 70
bold.split <- unname(split(spp.list, ceiling(seq_along(spp.list)/chunk.size.bold)))
bold.split <- bold.split[1:4]

# query BOLD and retrieve a table
# sometimes an error occurs, just run again
bold.all <- mcmapply(FUN=function(x) bold_seqspec(x,format="tsv",sepfasta=FALSE,response=FALSE), bold.split, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores)

# check for errors (should be "data.frame" or "logical", not "character")
if(length(sapply(bold.all, class)) == length(sapply(bold.all, class) == "data.frame")) {
    writeLines("\nBOLD results sucessfully retrieved")
    } else {writeLines("\nBOLD search failed, try again")}

# remove the non-dataframes
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
write_csv(bold.red,file="temp/bold-dump.csv")

# create a fasta file of BOLD
bold.fas <- tab2fas(df=bold.red,seqcol="nucleotides",namecol="processidUniq")

# add it to the GenBank file already created
write.FASTA(bold.fas, file="temp/mtdna-dump.fas", append=TRUE)


### report a summary table
stats <- tibble(
    stat=c("speciesTotal","speciesValid","speciesSynonyms","genbankVersion","queriesUnique","queriesMerged","queriesPerMerge","queriesMergedPerBatch","batches","maxRecordsPerMerge","totalRecordsGenbank","totalRecordsBold"),
    n=c(species.table %>% distinct(speciesName) %>% nrow(),
        species.table %>% filter(status == "accepted name") %>% distinct(speciesName) %>% nrow(),
        species.table %>% filter(status != "accepted name") %>% distinct(speciesName) %>% nrow(),
        gb.version,
        length(query),
        length(query.cat),
        chunk.size.rentrez,
        cores,
        length(queries.chunked),
        search.flat %>% purrr::map(~{unname(.x$count)}) %>% purrr::flatten_int() %>% max(),
        length(search.ids),
        length(pull(bold.red,processidUniq))
        )
)

# print and save
writeLines("\nPrinting stats ...\n")
print(stats,n=Inf)
write_csv(stats,file="reports/stats.csv")
writeLines("\nAll operations completed!\nPlease read previous messages in case of error")
