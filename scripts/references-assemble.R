#!/usr/bin/env Rscript

# R script to make reference databases for UK fishes for multiple markers
# then, it uses a hidden markov model to pull out the fragment of interest from all that mtDNA data
# then, it queries NCBI/BOLD for those accessions, and retrieves full metadata for them to allow better curation of reference database
# output is a csv dataframe of all accessions with data for all primer sets if present

## Load functions and libs
source(here::here("scripts/load-libs.R"))

# load synonyms from rfishbase
source(here::here("scripts/load-synonyms.R"))

# check ncbi key loaded
#Sys.getenv("ENTREZ_KEY", "")

# get args
option_list <- list(
    make_option(c("-t","--threads"), type="numeric"),
    make_option(c("-m","--metabarcode"), type="character")
    )

# set args
opt <- optparse::parse_args(optparse::OptionParser(option_list=option_list,add_help_option=FALSE))
# if running line-by-line
#opt <- NULL
#opt$threads <- 1
#opt$metabarcode <- "coi.ward"
#"all"#"12s.taberlet"#"coi.lerayxt"#

# set cores - mc.cores=1 is the safest option, but try extra cores to speed up if there are no errors
cores <- opt$threads


## Data
# load up the species table
species.table <- readr::read_csv(file=here("assets/species-table.csv"),show_col_types=FALSE)
# load the BOLD dump
if (file.exists(here::here("temp/bold-dump.csv"))) {
    bold.red <- readr::read_csv(file=here::here("temp/bold-dump.csv"), guess_max=100000,show_col_types=FALSE)
}
# load up stats
stats <- readr::read_csv(file=here::here("reports/stats.csv"),show_col_types=FALSE)

## Extract the frag of interest using the HMMs in hmmer
# assumes the hidden markov model is located in assets/hmms directory and is named '$prefix.hmm'
# returns a DNAbin object of the sequences matched by hmmer 

# get list of metabarodes
prefixes.list <- c("coi.lerayxt","coi.ward","12s.miya","12s.riaz","12s.valentini","12s.taberlet","16s.berry","cytb.minamoto","16s.kitano")
# split the input
prefixes.chosen <- unlist(stringr::str_split(opt$metabarcode,","))

# choose metabarcode
if(opt$metabarcode == "all") {
    prefixes.all <- c("coi.lerayxt.noprimers","coi.ward.noprimers","12s.miya.noprimers","12s.riaz.noprimers","12s.valentini.noprimers","12s.taberlet.noprimers","16s.berry.noprimers","cytb.minamoto.noprimers","16s.kitano.noprimers")
} else if (all(prefixes.chosen %in% prefixes.list)) {
    prefixes.all <- paste(prefixes.chosen,"noprimers",sep=".")
} else stop(cli::cli_alert_danger("'-m' value must be metabarcode(s) listed in Table 1, and separated by a comma, e.g. '12s.miya,coi.ward'."))


# run hmmer
cli_report(txt="Extracting metabarcode fragments with HMMER (may take several minutes) ...",rule=FALSE,alert="info")
# use single thread because easier on the RAM
dat.frag.all <- lapply(prefixes.all, function(x) run_hmmer3(dir="temp", infile="mtdna-dump.fas", prefix=x, evalue="10", coords="env"))
cli_report(txt="Done.",rule=FALSE,alert="success")

# concatentate all
dat.frag.cat <- do.call(c,dat.frag.all)

# get unique names
dat.frag.names <- unique(labels(dat.frag.cat))

if (file.exists(here::here("temp/bold-dump.csv"))) {
# separate the extracted sequences that are in GenBank or BOLD
in.bold <- dat.frag.names[dat.frag.names %in% bold.red$processidUniq]
in.gb <- dat.frag.names[!dat.frag.names %in% bold.red$processidUniq]
} else {
    in.gb <- dat.frag.names
}

# now for the same sequences, get the tabular data from NCBI using 'ncbi_byid' 
# chunk 200 should result in string of around 2200 chars
chunk <- 100
# clean up long genome records with accs > 11 chars 
in.gb.red <- in.gb[nchar(in.gb)<=11]
# randomise accessions
set.seed(42)
in.gb.sam <- sample(in.gb.red)

# chunk
chunk.frag <- unname(split(in.gb.sam, ceiling(seq_along(in.gb.sam)/chunk)))
#length(chunk.frag)
#max(sapply(chunk.frag,function(x) nchar(paste(x,collapse=","))))
cli_report(txt="Retrieving metadata from NCBI ...",rule=FALSE,alert="info")

    start_time <- Sys.time()
# parallel ncbi
ncbi.frag <- mcmapply(FUN=ncbi_byid_parallel, chunk.frag, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores)
    end_time <- Sys.time()
    cli_report(txt=glue::glue("Total time taken: {round(as.numeric(end_time-start_time,units='mins'),digits=2)} minutes."),rule=FALSE,alert="info")

# check for errors (should all be "data.frame")
if(length(sapply(ncbi.frag,class)) == length(which(sapply(ncbi.frag,class) == "data.frame"))) {
    cli_report(txt="NCBI metadata sucessfully retrieved.",rule=FALSE,alert="success")
    } else {stop(cli::cli_alert_danger("NCBI search failed, try again"))}

# join all the data sets
cli_report(txt="Now cleaning data ...",rule=FALSE,alert="info")
frag.df <- tibble::as_tibble(dplyr::bind_rows(ncbi.frag))

# from GenBank remove ncbi genome and other duplicates etc, and clean the lat/lon data
frag.df %<>% dplyr::filter(gi_no!="NCBI_GENOMES") %>% 
    dplyr::mutate(genbankVersion=pull(filter(stats,stat=="genbankVersion"),n),searchDate=dplyr::pull(dplyr::filter(stats,stat=="date"),n)) %>%
    dplyr::distinct(gi_no, .keep_all=TRUE) %>% 
    #mutate(acc_no=str_replace_all(acc_no,"\\.[0-9]",""), source="GENBANK") %>%
    dplyr::mutate(source="GENBANK") %>%
    dplyr::mutate(lat=paste(str_split_fixed(lat_lon, " ", 4)[,1], stringr::str_split_fixed(lat_lon, " ", 4)[,2]), lon=paste(stringr::str_split_fixed(lat_lon, " ", 4)[,3], stringr::str_split_fixed(lat_lon, " ", 4)[,4])) %>%
    dplyr::mutate(lat=dplyr::if_else(grepl(" N",lat), true=stringr::str_replace_all(lat," N",""), false=dplyr::if_else(grepl(" S",lat), true=paste0("-",stringr::str_replace_all(lat," S","")), false=lat))) %>%
    dplyr::mutate(lon=dplyr::if_else(grepl(" E",lon), true=stringr::str_replace_all(lon," E",""), false=dplyr::if_else(grepl(" W",lon), true=paste0("-",stringr::str_replace_all(lon," W","")), false=lon))) %>% 
    dplyr::mutate(lat=stringr::str_replace_all(lat,"^ ", NA_character_), lon=stringr::str_replace_all(lon,"^ ", NA_character_)) %>%
    dplyr::mutate(lat=suppressWarnings(as.numeric(lat)), lon=suppressWarnings(as.numeric(lon))) %>% 
    dplyr::select(-taxonomy,-organelle,-keyword,-lat_lon) %>% 
    dplyr::mutate(institutionCode=NA_character_) %>%
    dplyr::rename(sciNameOrig=taxon,notesGenBank=gene_desc,dbid=gi_no,gbAccession=acc_no,catalogNumber=specimen_voucher,publishedAs=paper_title,publishedIn=journal,publishedBy=first_author,date=uploaded_date,decimalLatitude=lat,decimalLongitude=lon,nucleotides=sequence)

# do the same for BOLD
# run
if (file.exists(here::here("temp/bold-dump.csv"))) {

bold.red %<>% dplyr::filter(!is.na(species_name)) %>%
    dplyr::filter(processidUniq %in% in.bold) %>%
    dplyr::filter(!genbank_accession %in% stringr::str_replace_all(frag.df$gbAccession,"\\..+","")) %>%
    dplyr::mutate(source="BOLD",nucleotides=stringr::str_to_lower(nucleotides), length=as.character(stringr::str_length(nucleotides))) %>% 
    dplyr::select(source,processidUniq,genbank_accession,species_name,lat,lon,country,institution_storing,catalognum,nucleotides,length) %>%
    dplyr::rename(dbid=processidUniq,gbAccession=genbank_accession,sciNameOrig=species_name,decimalLatitude=lat,decimalLongitude=lon,institutionCode=institution_storing,catalogNumber=catalognum)

# merge gb and bold data
dbs.merged.all <- dplyr::bind_rows(frag.df,bold.red) %>% dplyr::mutate(matchCol=if_else(grepl("\\.COI-5P",dbid),dbid,gbAccession)) 

} else {
    dbs.merged.all <- frag.df %>% dplyr::mutate(matchCol=dplyr::if_else(grepl("\\.COI-5P",dbid),dbid,gbAccession)) 
}


# name each DNAbin object
names(dat.frag.all) <- prefixes.all

# extract nucleotides out of the DNAbin objects
dat.frag.flat <- lapply(dat.frag.all, function(x) mcmapply(stringr::str_flatten, as.character(x), mc.cores=cores, SIMPLIFY=TRUE,USE.NAMES=TRUE))

# turn each into a dataframe
dat.frag.df <- lapply(dat.frag.flat, function(x) tibble::tibble(names=names(x), seqs=unlist(x), lengthFrag=stringr::str_length(seqs)))

# rename each df with names of the fragment
dat.frag.df <- mapply(function(x,y,z) dplyr::rename(x,dbid=names, !!y:=seqs, !!z:=lengthFrag), dat.frag.df, paste("nucleotidesFrag",names(dat.frag.df),sep="."), paste("lengthFrag",names(dat.frag.df),sep="."), SIMPLIFY=FALSE)

# merge all the data frames 
dat.frag.merged <- dat.frag.df %>% purrr::reduce(dplyr::full_join, by="dbid") %>% dplyr::rename(matchCol=dbid)

# join with the metadata dataframe
dbs.merged.all <- dplyr::left_join(dbs.merged.all,dat.frag.merged,by="matchCol")


## add fishbase taxonomy ##

# make a binomial scientific name - clean mess
dbs.merged.all %<>% dplyr::mutate(sciNameBinomen=sciNameOrig,sciNameBinomen=stringr::str_replace_all(sciNameBinomen," sp\\. "," sp."),sciNameBinomen=stringr::str_replace_all(sciNameBinomen," cf\\. "," cf."),sciNameBinomen=stringr::str_replace_all(sciNameBinomen," aff\\. "," aff.")) %>% 
    dplyr::mutate(sciNameBinomen=apply(stringr::str_split_fixed(sciNameBinomen, " ", 3)[,1:2], 1, paste, collapse=" "))

# make ref of valid species 
uk.species.valid <- species.table %>% dplyr::distinct(fbSpecCode,validName,class,order,family,genus,commonName) %>% dplyr::mutate(rank=if_else(grepl(" ",validName),"species","genus"))
uk.species.genera <- uk.species.valid %>% dplyr::filter(rank=="genus") %>% dplyr::pull(validName)

# annotate with fishbase codes and valid species names
dbs.merged.all %<>% dplyr::mutate(fbSpecCode=dplyr::pull(fishbase.synonyms.acc,SpecCode)[match(sciNameBinomen,dplyr::pull(fishbase.synonyms.acc,synonym))]) %>% 
    dplyr::mutate(fbSpecCode=dplyr::if_else(is.na(fbSpecCode),dplyr::pull(fishbase.synonyms.syn,SpecCode)[match(sciNameBinomen,dplyr::pull(fishbase.synonyms.syn,synonym))],fbSpecCode)) %>%
    dplyr::mutate(genus=stringr::str_split_fixed(sciNameBinomen," ",2)[,1]) %>%
    dplyr::mutate(rank=dplyr::if_else(genus %in% uk.species.genera,"genus","species")) %>%
    dplyr::mutate(sciNameValid=dplyr::if_else(rank=="species",dplyr::pull(uk.species.valid,validName)[match(fbSpecCode,dplyr::pull(uk.species.valid,fbSpecCode))],sciNameBinomen)) %>%
    dplyr::mutate(genus=dplyr::if_else(rank=="species",stringr::str_split_fixed(sciNameValid," ",2)[,1],genus)) # update genus from valid name

# drop missing taxa
missing <- dbs.merged.all %>% dplyr::filter(is.na(sciNameValid)) %>% dplyr::pull(sciNameOrig) %>% unique()
if(length(missing)>0) {
    cli_report(txt=glue::glue("The following taxa could not be found in the species database and have been dropped: {paste(missing,collapse=', ')}"),rule=FALSE,alert="info")
    dbs.merged.all %<>% dplyr::filter(!is.na(sciNameValid))
}

# flag genus level taxa
only.genera <- dbs.merged.all %>% dplyr::filter(rank=="genus") %>% dplyr::distinct(sciNameValid) %>% dplyr::pull()
if(length(only.genera)>0) {
    cli_report(txt=glue::glue("The following taxa were searched for at the genus level: {paste(only.genera,collapse=', ')}"),rule=FALSE,alert="info")
}

# print all the species that had their names updated
updated <- dbs.merged.all %>% dplyr::filter(sciNameOrig != sciNameValid) %>% dplyr::select(sciNameOrig,sciNameValid) %>% dplyr::arrange(sciNameOrig) %>% dplyr::distinct()
if(nrow(updated)>0) {
    cli_report(txt="The following taxa had their GenBank names updated using FishBase:",rule=FALSE,alert="info")
    updated %>% knitr::kable()
}

# add taxonomy
dbs.merged.all %<>% dplyr::mutate(phylum="Chordata") %>%
    dplyr::left_join(dplyr::distinct(uk.species.valid,class,order,family,genus),by="genus")

# report and remove any incomplete taxonomy
no.tax <- dbs.merged.all %>% dplyr::filter(is.na(class) | is.na(order) | is.na(family)) %>% dplyr::select(class,order,family,sciNameOrig,sciNameValid) %>% dplyr::arrange(sciNameOrig) %>% dplyr::distinct()
if(nrow(no.tax)>0) {
    cli_report(txt="The following taxa could not be assigned taxonomy. Consider adding these to the species table if you want to keep them.",rule=FALSE,alert="info")
    no.tax %>% knitr::kable()
}

# clean up nucs
dbs.merged.all %<>% dplyr::mutate(nucleotides=stringr::str_to_lower(nucleotides))


## Clean up to make the table human readable

# drop the DNA fragments and reorder the columns 
dbs.merged.info <- dbs.merged.all %>% dplyr::select(-matches("Frag")) %>% 
    dplyr::select(source,dbid,gbAccession,sciNameValid,phylum,class,order,family,genus,sciNameOrig,fbSpecCode,
        country,catalogNumber,institutionCode,decimalLatitude,decimalLongitude,publishedAs,publishedIn,publishedBy,
        date,notesGenBank,genbankVersion,searchDate,length,nucleotides)

# make a data frame of just the sequence data
dbs.merged.seqs <- dbs.merged.all %>% dplyr::select(tidyselect::matches("Frag|dbid"))

# remerge with the reorganised dataframe and remove any ids with no nucleotides
dbs.merged.final <- dplyr::left_join(dbs.merged.info,dbs.merged.seqs,by="dbid") %>%
    dplyr::arrange(class,order,family,genus,sciNameValid) %>% 
    dplyr::filter(!is.na(nucleotides))

# write out a gzipped file (orig is too big for github)
cli_report(txt="Writing out reference library to 'assets/reference-library-master.csv.gz' ...",rule=FALSE,alert="info")
readr::write_csv(dbs.merged.final, file=gzfile(here::here("assets/reference-library-master.csv.gz")), na="")
cli_report(txt="All operations completed. Please read previous messages in case of error.",rule=TRUE,alert="success")
