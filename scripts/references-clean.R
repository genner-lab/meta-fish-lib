#!/usr/bin/env Rscript
# script to load up reference libraries and clean them up

# load funs
source("https://raw.githubusercontent.com/boopsboops/UTILITIES/main/RScripts/tab2fas.R")
source("https://raw.githubusercontent.com/boopsboops/UTILITIES/main/RScripts/subset_references.R")
source("https://raw.githubusercontent.com/boopsboops/UTILITIES/main/RScripts/hap_collapse_df.R")
source("https://raw.githubusercontent.com/boopsboops/UTILITIES/main/RScripts/derep_filter.R")
source("https://raw.githubusercontent.com/boopsboops/UTILITIES/main/RScripts/write_references_fasta.R")

# exclude bad seqs and clean
reflib.cleaned <- reflib.orig %>% 
    dplyr::filter(!dbid %in% (exclusions %>% dplyr::filter(action=="REMOVE") %>% dplyr::pull(dbid)))

# reassign taxonomy for some ambiguous or recently changed species
reflib.cleaned <- reflib.cleaned %>% 
    dplyr::left_join(taxonomy.changes,by="sciNameValid") %>%
    mutate(sciNameValid=if_else(is.na(sciNameValidAmended),sciNameValid,sciNameValidAmended)) %>%
    select(-sciNameValidAmended)
    #filter(sciNameValid=="Pungitius laevis" | sciNameValid=="Cottus perifretum" | sciNameValid=="Atherina presbyter")

# remove unverified sequences
# remove any NA nucleotides
# remove mRNA
# remove cDNA
reflib.cleaned <- reflib.cleaned %>% 
    dplyr::filter(!is.na(nucleotides)) %>% 
    dplyr::filter(!grepl("UNVERIFIED:",notesGenBank)) %>%
    dplyr::filter(!grepl("PREDICTED:",notesGenBank)) %>%
    dplyr::filter(!grepl("similar to",notesGenBank)) %>% 
    dplyr::filter(!grepl("mRNA",notesGenBank)) %>% 
    dplyr::filter(!grepl("cDNA",notesGenBank)) %>% 
    dplyr::filter(!grepl("transcribed",notesGenBank)) %>% 
    dplyr::filter(!grepl("-like",notesGenBank)) 

# alert taxonomic changes
taxonomy.changes %>% 
    dplyr::rename(`Original name`=sciNameValid,`Amended name`=sciNameValidAmended) %>%
    print(n=Inf)

# remove orig df
rm(reflib.orig)
rm(taxonomy.changes)

# write encouraging words
writeLines("\nReference library object 'reflib.cleaned' is cleaned and in your memory.\nBlacklisted GenBank accessions were removed.\nThe above taxonomic changes were made.\n")
