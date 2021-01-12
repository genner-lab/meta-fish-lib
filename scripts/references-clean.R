#!/usr/bin/env Rscript
# script to load up reference libraries and clean them up

# copy
uk.species.table.orig <- uk.species.table

# remove synonyms
uk.species.table <- uk.species.table %>% 
    dplyr::select(validName,class,order,family,genus,commonName,commonSpecies) %>% 
    dplyr::distinct()

# change taxonomy for some common species
uk.species.table <- uk.species.table %>% 
    dplyr::filter(validName!="Pungitius laevis",validName!="Cottus perifretum",validName!="Atherina presbyter")

# filter common
uk.species.table.common <- uk.species.table %>% 
    dplyr::filter(commonSpecies==TRUE)

# exclude bad seqs and clean
reflib.orig <- reflib.orig %>% 
    dplyr::filter(!dbid %in% exclusions$dbid[exclusions$action=="REMOVE"])

# reassign taxonomy for some recently changed species
reflib.orig <- reflib.orig %>% 
    dplyr::mutate(sciNameValid=str_replace_all(sciNameValid,"Pungitius laevis","Pungitius pungitius")) %>% 
    dplyr::mutate(sciNameValid=str_replace_all(sciNameValid,"Cottus perifretum","Cottus gobio")) %>% 
    dplyr::mutate(sciNameValid=str_replace_all(sciNameValid,"Atherina presbyter","Atherina boyeri"))

# remove unverified sequences
# remove any NA nucleotides
# remove mRNA
# remove cDNA
reflib.orig <- reflib.orig %>% 
    dplyr::filter(!is.na(nucleotides)) %>% 
    dplyr::filter(!grepl("UNVERIFIED:",notesGenBank)) %>%
    dplyr::filter(!grepl("similar to",notesGenBank)) %>% 
    dplyr::filter(!grepl("mRNA",notesGenBank)) %>% 
    dplyr::filter(!grepl("cDNA",notesGenBank)) %>% 
    dplyr::filter(!grepl("transcribed",notesGenBank)) %>% 
    dplyr::filter(!grepl("-like",notesGenBank)) 

# alert taxonomic changes
tibble::tibble(
	scientificName=c("Pungitius laevis","Cottus perifretum","Atherina presbyter"),
	ammendedName=c("Pungitius pungitius","Cottus gobio","Atherina boyeri")
	) %>% print(n=Inf)

# write encouraging words
writeLines("\nReference library object 'reflib.orig' is cleaned and in your memory.\nBlacklisted GenBank accessions were removed.\nThe above taxonomic changes were made.")

# load up cleaning fun
subset_references <- function(df,frag) {
    frag <- paste0("nucleotidesFrag.",frag,".noprimers")
    reflib.sub <- df %>% dplyr::filter(!is.na(!!as.name(frag))) %>%
        dplyr::mutate(nucleotides=!!as.name(frag), length=!!as.name(str_replace_all(frag,"nucleotides","length"))) %>%
        select(-contains("Frag"))
    return(reflib.sub)
}
