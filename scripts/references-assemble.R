#!/usr/bin/env Rscript

# R script to make reference databases for UK fishes for multiple markers
# then, it uses a hidden markov model to pull out the fragment of interest from all that mtDNA data
# then, it queries NCBI/BOLD for those accessions, and retrieves full metadata for them to allow better curation of reference database
# output is a csv dataframe of all accessions with data for all primer sets if present

## Load functions and libs
source(here::here("scripts/load-libs.R"))

# load synonyms from rfishbase
source(here("scripts/load-synonyms.R"))

# check ncbi key loaded
#Sys.getenv("ENTREZ_KEY", "")

# get args
option_list <- list(
    make_option(c("-t","--threads"), type="numeric"),
    make_option(c("-m","--metabarcode"), type="character")
    )

# set args
opt <- parse_args(OptionParser(option_list=option_list,add_help_option=FALSE))
# if running line-by-line
#opt <- NULL
#opt$threads <- 1
#opt$metabarcode <- "coi.lerayxt"
#"all"#"12s.taberlet"#"coi.lerayxt"#

# set cores - mc.cores=1 is the safest option, but try extra cores to speed up if there are no errors
cores <- opt$threads


## Data
# load up the species table
species.table <- read_csv(file=here("assets/species-table.csv"),show_col_types=FALSE)
# load the BOLD dump
bold.red <- read_csv(file=here("temp/bold-dump.csv"), guess_max=100000,show_col_types=FALSE)
# load up stats
stats <- read_csv(file=here("reports/stats.csv"),show_col_types=FALSE)

## Extract the frag of interest using the HMMs in hmmer
# assumes the hidden markov model is located in assets/hmms directory and is named '$prefix.hmm'
# returns a DNAbin object of the sequences matched by hmmer 

# get list of metabarodes
prefixes.list <- c("coi.lerayxt","coi.ward","12s.miya","12s.riaz","12s.valentini","12s.taberlet","16s.berry","cytb.minamoto","16s.kitano")
# split the input
prefixes.chosen <- unlist(str_split(opt$metabarcode,","))

# choose metabarcode
if(opt$metabarcode == "all") {
    prefixes.all <- c("coi.lerayxt.noprimers","coi.ward.noprimers","12s.miya.noprimers","12s.riaz.noprimers","12s.valentini.noprimers","12s.taberlet.noprimers","16s.berry.noprimers","cytb.minamoto.noprimers","16s.kitano.noprimers")
} else if (all(prefixes.chosen %in% prefixes.list)) {
    prefixes.all <- paste(prefixes.chosen,"noprimers",sep=".")
} else stop(writeLines("'-m' value must be metabarcode(s) listed in Table 1, and separated by a comma, e.g. '12s.miya,coi.ward'."))


# run hmmer
writeLines("\nExtracting metabarcode fragments with HMMER (may take several minutes) ...")
# use single thread because easier on the RAM
dat.frag.all <- lapply(prefixes.all, function(x) run_hmmer3(dir="temp", infile="mtdna-dump.fas", prefix=x, evalue="10", coords="env"))
writeLines("\nDone")

# concatentate all
dat.frag.cat <- do.call(c,dat.frag.all)

# get unique names
dat.frag.names <- unique(labels(dat.frag.cat))

# separate the extracted sequences that are in GenBank or BOLD
in.bold <- dat.frag.names[dat.frag.names %in% bold.red$processidUniq]
in.gb <- dat.frag.names[!dat.frag.names %in% bold.red$processidUniq]

# now for the same sequences, get the tabular data from NCBI using 'ncbi_byid' 
# chunk 200 should result in string of around 2200 chars
chunk <- 200
# clean up long genome records with accs > 11 chars 
in.gb.red <- in.gb[nchar(in.gb)<=11]
# randomise accessions
set.seed(42)
in.gb.sam <- sample(in.gb.red)

# chunk
chunk.frag <- unname(split(in.gb.sam, ceiling(seq_along(in.gb.sam)/chunk)))
#length(chunk.frag)
#max(sapply(chunk.frag,function(x) nchar(paste(x,collapse=","))))
writeLines("\nRetrieving metadata from NCBI ...\n")
    start_time <- Sys.time()
# parallel ncbi
ncbi.frag <- mcmapply(FUN=ncbi_byid_parallel, chunk.frag, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=cores)
    end_time <- Sys.time()
    end_time-start_time

# check for errors (should all be "data.frame")
if(length(sapply(ncbi.frag,class)) == length(which(sapply(ncbi.frag,class) == "data.frame"))) {
    writeLines("\nNCBI metadata sucessfully retrieved")
    } else {writeLines("\nNCBI search failed, try again")}

# join all the data sets
writeLines("\nNow cleaning data ...")
frag.df <- as_tibble(bind_rows(ncbi.frag))

# from GenBank remove ncbi genome and other duplicates etc, and clean the lat/lon data
frag.df %<>% filter(gi_no!="NCBI_GENOMES") %>% 
    mutate(genbankVersion=pull(filter(stats,stat=="genbankVersion"),n),searchDate=pull(filter(stats,stat=="date"),n)) %>%
    distinct(gi_no, .keep_all=TRUE) %>% 
    #mutate(acc_no=str_replace_all(acc_no,"\\.[0-9]",""), source="GENBANK") %>%
    mutate(source="GENBANK") %>%
    mutate(lat=paste(str_split_fixed(lat_lon, " ", 4)[,1], str_split_fixed(lat_lon, " ", 4)[,2]), lon=paste(str_split_fixed(lat_lon, " ", 4)[,3], str_split_fixed(lat_lon, " ", 4)[,4])) %>%
    mutate(lat=if_else(grepl(" N",lat), true=str_replace_all(lat," N",""), false=if_else(grepl(" S",lat), true=paste0("-",str_replace_all(lat," S","")), false=lat))) %>%
    mutate(lon=if_else(grepl(" E",lon), true=str_replace_all(lon," E",""), false=if_else(grepl(" W",lon), true=paste0("-",str_replace_all(lon," W","")), false=lon))) %>% 
    mutate(lat=str_replace_all(lat,"^ ", NA_character_), lon=str_replace_all(lon,"^ ", NA_character_)) %>%
    mutate(lat=suppressWarnings(as.numeric(lat)), lon=suppressWarnings(as.numeric(lon))) %>% 
    select(-taxonomy,-organelle,-keyword,-lat_lon) %>% 
    rename(sciNameOrig=taxon,notesGenBank=gene_desc,dbid=gi_no,gbAccession=acc_no,catalogNumber=specimen_voucher,publishedAs=paper_title,publishedIn=journal,publishedBy=first_author,date=uploaded_date,decimalLatitude=lat,decimalLongitude=lon,nucleotides=sequence)

# do the same for BOLD
# run
bold.red %<>% filter(!is.na(species_name)) %>%
    filter(processidUniq %in% in.bold) %>%
    filter(!genbank_accession %in% str_replace_all(frag.df$gbAccession,"\\..+","")) %>%
    mutate(source="BOLD",nucleotides=str_to_lower(nucleotides), length=as.character(str_length(nucleotides))) %>% 
    select(source,processidUniq,genbank_accession,species_name,lat,lon,country,institution_storing,catalognum,nucleotides,length) %>%
    rename(dbid=processidUniq,gbAccession=genbank_accession,sciNameOrig=species_name,decimalLatitude=lat,decimalLongitude=lon,institutionCode=institution_storing,catalogNumber=catalognum)

# merge gb and bold data
dbs.merged.all <- bind_rows(frag.df,bold.red) %>% mutate(matchCol=if_else(grepl("\\.COI-5P",dbid),dbid,gbAccession)) 

# name each DNAbin object
names(dat.frag.all) <- prefixes.all

# extract nucleotides out of the DNAbin objects
dat.frag.flat <- lapply(dat.frag.all, function(x) mcmapply(str_flatten, as.character(x), mc.cores=cores, SIMPLIFY=TRUE,USE.NAMES=TRUE))

# turn each into a dataframe
dat.frag.df <- lapply(dat.frag.flat, function(x) tibble(names=names(x), seqs=unlist(x), lengthFrag=str_length(seqs)))

# rename each df with names of the fragment
dat.frag.df <- mapply(function(x,y,z) dplyr::rename(x,dbid=names, !!y:=seqs, !!z:=lengthFrag), dat.frag.df, paste("nucleotidesFrag",names(dat.frag.df),sep="."), paste("lengthFrag",names(dat.frag.df),sep="."), SIMPLIFY=FALSE)

# merge all the data frames 
dat.frag.merged <- dat.frag.df %>% purrr::reduce(full_join, by="dbid") %>% rename(matchCol=dbid)

# join with the metadata dataframe
dbs.merged.all <- dplyr::left_join(dbs.merged.all,dat.frag.merged,by="matchCol")


## add fishbase taxonomy ##

# make a binomial scientific name - clean mess
dbs.merged.all %<>% mutate(sciNameBinomen=sciNameOrig,sciNameBinomen=str_replace_all(sciNameBinomen," sp\\. "," sp."),sciNameBinomen=str_replace_all(sciNameBinomen," cf\\. "," cf."),sciNameBinomen=str_replace_all(sciNameBinomen," aff\\. "," aff.")) %>% 
    mutate(sciNameBinomen=apply(str_split_fixed(sciNameBinomen, " ", 3)[,1:2], 1, paste, collapse=" "))

# make ref of valid species 
uk.species.valid <- species.table %>% distinct(fbSpecCode,validName,class,order,family,genus,commonName) %>% mutate(rank=if_else(grepl(" ",validName),"species","genus"))
uk.species.genera <- uk.species.valid %>% filter(rank=="genus") %>% pull(validName)

# annotate with fishbase codes and valid species names
dbs.merged.all %<>% mutate(fbSpecCode=pull(fishbase.synonyms.acc,SpecCode)[match(sciNameBinomen,pull(fishbase.synonyms.acc,synonym))]) %>% 
    mutate(fbSpecCode=if_else(is.na(fbSpecCode),pull(fishbase.synonyms.syn,SpecCode)[match(sciNameBinomen,pull(fishbase.synonyms.syn,synonym))],fbSpecCode)) %>%
    mutate(genus=str_split_fixed(sciNameBinomen," ",2)[,1]) %>%
    mutate(rank=if_else(genus %in% uk.species.genera,"genus","species")) %>%
    mutate(sciNameValid=if_else(rank=="species",pull(uk.species.valid,validName)[match(fbSpecCode,pull(uk.species.valid,fbSpecCode))],sciNameBinomen)) %>%
    mutate(genus=if_else(rank=="species",str_split_fixed(sciNameValid," ",2)[,1],genus)) # update genus from valid name

# drop missing taxa
missing <- dbs.merged.all %>% filter(is.na(sciNameValid)) %>% pull(sciNameOrig) %>% unique()
if(length(missing)>0) {
    writeLines(paste("\nThe following taxa could not be found in the species database and have been dropped:",paste(missing,collapse=", ")))
    dbs.merged.all %<>% filter(!is.na(sciNameValid))
}

# flag genus level taxa
only.genera <- dbs.merged.all %>% filter(rank=="genus") %>% distinct(sciNameValid) %>% pull()
if(length(only.genera)>0) {
    writeLines(paste("\nThe following taxa were searched for at the genus level:",paste(only.genera,collapse=", ")))
}

# print all the species that had their names updated
updated <- dbs.merged.all %>% filter(sciNameOrig != sciNameValid) %>% select(sciNameOrig,sciNameValid) %>% arrange(sciNameOrig) %>% distinct()
if(nrow(updated)>0) {
    writeLines("\nThe following taxa had their GenBank names updated using FishBase:")
    print(updated,n=Inf)
}

# add taxonomy
dbs.merged.all %<>% mutate(phylum="Chordata") %>%
    left_join(distinct(uk.species.valid,class,order,family,genus),by="genus")

# report and remove any incomplete taxonomy
no.tax <- dbs.merged.all %>% filter(is.na(class) | is.na(order) | is.na(family)) %>% select(class,order,family,sciNameOrig,sciNameValid) %>% arrange(sciNameOrig) %>% distinct()
if(nrow(no.tax)>0) {
    writeLines("\nThe following taxa could not be assigned taxonomy. Consider adding these to the species table if you want to keep them.")
    print(no.tax,n=Inf)
}

# clean up nucs
dbs.merged.all %<>% mutate(nucleotides=str_to_lower(nucleotides))


## Clean up to make the table human readable

# drop the DNA fragments and reorder the columns 
dbs.merged.info <- dbs.merged.all %>% select(-matches("Frag")) %>% 
    select(source,dbid,gbAccession,sciNameValid,phylum,class,order,family,genus,sciNameOrig,fbSpecCode,
    country,catalogNumber,institutionCode,decimalLatitude,decimalLongitude,publishedAs,publishedIn,publishedBy,
    date,notesGenBank,genbankVersion,searchDate,length,nucleotides)

# make a data frame of just the sequence data
dbs.merged.seqs <- dbs.merged.all %>% select(matches("Frag|dbid"))

# remerge with the reorganised dataframe and remove any ids with no nucleotides
dbs.merged.final <- left_join(dbs.merged.info,dbs.merged.seqs,by="dbid") %>%
    arrange(class,order,family,genus,sciNameValid) %>% 
    filter(!is.na(nucleotides))

# take a look 
#writeLines("\nReference library fields:")
#glimpse(dbs.merged.final)

# write out a gzipped file (orig is too big for github)
writeLines("\nWriting out reference library to 'assets/reference-library-master.csv.gz' ...")
write_csv(dbs.merged.final, file=gzfile(here("assets/reference-library-master.csv.gz")), na="")
writeLines("\nAll operations completed!\nPlease read previous messages in case of error")
