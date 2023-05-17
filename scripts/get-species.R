#!/usr/bin/env Rscript
# script to make a species and synonym list for a given country  
# scripts/get-species.R -c 826 -s true

# load functions and libs
source(here::here("scripts","load-libs.R"))

# get args
option_list <- list( 
    make_option(c("-c","--country"), type="character"),
    make_option(c("-s","--synonyms"), type="character")
    )

# set args
opt <- parse_args(OptionParser(option_list=option_list,add_help_option=FALSE))

# status
writeLines(paste0("\nSearching FishBase ..."))

# dummy args
#opt <- NULL
#opt$country <- "826"
#opt$synonyms <- "true"

### Species lists

# load countries
# filter on country of interest - use ISO country codes
# ISO country code "826" is "United Kingdom"
# also remove subspecific names
species.list <- suppressMessages(rfishbase::country(server="fishbase")) %>% 
    filter(C_Code==opt$country) %>% 
    mutate(Species=paste(str_split_fixed(Species," ",3)[,1],str_split_fixed(Species," ",3)[,2])) %>%
    distinct(SpecCode,Species)


### Synonyms

# load synonyms
# clean up to get only synonyms and accepted names
# remove records with non alphabetic characters
# remove species with >1 accepted names
fishbase.synonyms.clean <- rfishbase::synonyms(server="fishbase") %>% 
    select(synonym,Status,SpecCode,TaxonLevel) %>% 
    mutate(Status=str_replace_all(Status,"Synonym","synonym")) %>% 
    filter(Status=="synonym" | Status=="accepted name") %>% 
    filter(!str_detect(synonym,"[^a-zA-Z\\d\\s:]")) %>%
    group_by(SpecCode) %>% 
    mutate(nacc=length(unique(synonym[Status=="accepted name"]))) %>%
    ungroup() %>%
    mutate(dup=if_else(nacc>1 & TaxonLevel=="Nominotypical" & Status=="accepted name",TRUE,FALSE)) %>%
    filter(dup==FALSE) %>%
    select(!dup)

# join the countries and synonyms tables
species.list.syn <- species.list %>% left_join(distinct(fishbase.synonyms.clean,synonym,Status,SpecCode),by="SpecCode")


### Taxonomy and common names

# load taxonomy and common name tables
fishbase.taxonomy <- rfishbase::load_taxa(server="fishbase")
fishbase.species <- rfishbase::species(server="fishbase")

# add the taxonomy
species.list.tax <- species.list.syn %>% left_join(distinct(as_tibble(fishbase.taxonomy),SpecCode,Genus,Family,Order,Class),by="SpecCode")

# add the common names
species.list.com <- species.list.tax %>% left_join(distinct(fishbase.species,SpecCode,Species,FBname),by=c("SpecCode","Species"))


### Format

# format
species.list.form <- species.list.com %>% 
    rename(speciesName=synonym,status=Status,fbSpecCode=SpecCode,validName=Species,class=Class,order=Order,family=Family,genus=Genus,commonName=FBname) %>% 
    mutate(commonSpecies=TRUE) %>%
    relocate(speciesName,status,fbSpecCode,validName,class,order,family,genus,commonName,commonSpecies) %>% 
    arrange(class,order,family,genus,validName,status,speciesName) 

# keep or remove synonyms
if(opt$synonyms == "true") {
    species.list.form <- species.list.form
} else if (opt$synonyms == "false") {
    species.list.form <- species.list.form %>% filter(status=="accepted name")
} else stop(writeLines("'-s' value must be 'true' or 'false'."))


### Write out

# get stats
if(opt$synonyms == "true") {
    acc <- species.list.form %>% count(status) %>% filter(status=="accepted name") %>% pull(n)
    syn <- species.list.form %>% count(status) %>% filter(status=="synonym") %>% pull(n)
} else if (opt$synonyms == "false") {
    acc <- species.list.form %>% count(status) %>% filter(status=="accepted name") %>% pull(n)
    syn <- "0"
} else stop(writeLines("'-s' value must be 'true' or 'false'."))


# write out
species.list.form %>% write_csv(file="assets/species-table.csv")
# print info
writeLines(paste0("\nWriting out species list ","for country ISO ",opt$country,", comprising ",acc," accepted names and ",syn," synonyms, to 'assets/species-table.csv'.\n"))
