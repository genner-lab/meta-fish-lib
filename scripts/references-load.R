#!/usr/bin/env Rscript
# script to load up reference libraries and clean them up
# load libs

# start timer
start_time <- Sys.time()

writeLines("\nLoading reference library ...")

## load up the species info table
# species data
uk.species.table <- vroom::vroom(here("assets","species-table.csv"),delim=",",num_threads=1,guess_max=99999,col_types=cols())
#"https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/species-table.csv"
uk.species.table.orig <- uk.species.table
# remove synonyms
uk.species.table %<>% select(validName,class,order,family,genus,commonName,commonSpecies) %>% distinct()
# change taxonomy for some common species
uk.species.table %<>% filter(validName!="Pungitius laevis",validName!="Cottus perifretum",validName!="Atherina presbyter")
# filter common
uk.species.table.common <- uk.species.table %>% filter(commonSpecies==TRUE)


## load up the reference library
reflib.orig <- vroom::vroom(here("assets","reference-library-master.csv.gz"),delim=",",num_threads=1,guess_max=99999,col_types=cols())
# "https://github.com/genner-lab/meta-fish-lib/raw/main/assets/reference-library-master.csv.gz"

## clean
# load up the exclusions file to clean the data
exclusions <- vroom::vroom(here("assets","exclusions.csv"),delim=",",num_threads=1,guess_max=99999,col_types=cols())
# "https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/exclusions.csv"

# exclude bad seqs and clean
reflib.orig %<>% filter(!dbid %in% exclusions$dbid[exclusions$action=="REMOVE"])

# reassign taxonomy for some recently changed species
reflib.orig %<>% mutate(sciNameValid=str_replace_all(sciNameValid,"Pungitius laevis","Pungitius pungitius")) %>% 
    mutate(sciNameValid=str_replace_all(sciNameValid,"Cottus perifretum","Cottus gobio")) %>% 
    mutate(sciNameValid=str_replace_all(sciNameValid,"Atherina presbyter","Atherina boyeri"))

# remove unverified sequences
# remove any NA nucleotides
# remove mRNA
# remove cDNA
reflib.orig %<>% 
    filter(!is.na(nucleotides)) %>% 
    filter(!grepl("UNVERIFIED:",notesGenBank)) %>%
    filter(!grepl("similar to",notesGenBank)) %>% 
    filter(!grepl("mRNA",notesGenBank)) %>% 
    filter(!grepl("cDNA",notesGenBank)) %>% 
    filter(!grepl("transcribed",notesGenBank)) %>% 
    filter(!grepl("-like",notesGenBank)) 

# end timer
end_time <- Sys.time()

# alert taxonomic changes
writeLines("\nThe following taxonomic changes were made:\n")
tibble(
	scientificName=c("Pungitius laevis","Cottus perifretum","Atherina presbyter"),
	ammendedName=c("Pungitius pungitius","Cottus gobio","Atherina boyeri")
	) %>% print(n=Inf)

# write encouraging words
writeLines(paste("\n", dim(reflib.orig)[1], "reference sequences loaded and filtered in", round(end_time-start_time,digits=1), "seconds"))
writeLines("\nA reference library object 'reflib.orig' is now in your memory")
