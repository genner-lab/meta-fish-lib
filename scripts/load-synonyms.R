#!/usr/bin/env Rscript

# R script to retrieve and clean synonyms from rfishbase

# rfishbase::species(server="fishbase",version="23.01") %>% glimpse()


# get up to date spp list and taxonomy
fishbase.synonyms <- rfishbase::synonyms(server="fishbase",version="23.01")

# clean up synonyms table - just accepted names and synonyms
fishbase.synonyms.clean <- fishbase.synonyms %>% 
    select(!all_of(c("CoL_ID","TSN","WoRMS_ID","ZooBank_ID"))) %>%
    mutate(Status=str_replace_all(Status,"^Synonym","synonym")) %>%
    mutate(Status=str_replace_all(Status,"^provisionally accepted name","accepted name")) %>%
    mutate(Status=str_replace_all(Status,"^ambiguous synonym","synonym")) %>%
    mutate(TaxonLevel=str_replace_all(TaxonLevel,"^species","Species")) %>%
    mutate(TaxonLevel=str_replace_all(TaxonLevel,"^subspecies","Subspecies")) %>%
    mutate(TaxonLevel=str_replace_all(TaxonLevel,"^Nominotypical","Subspecies")) %>%
    filter(Status=="synonym" | Status=="accepted name") %>%
    filter(TaxonLevel=="Species" | TaxonLevel=="Subspecies") %>%
    filter(SpecCode!=0) %>% 
    filter(!str_detect(synonym,"[^a-zA-Z\\d\\s:]"))

# clean up duplicate accepted names
fishbase.synonyms.acc <- fishbase.synonyms.clean %>%
    filter(Status=="accepted name" & TaxonLevel =="Species") %>%
        #add_count(synonym) %>%
        #filter(n>1) %>%
    add_count(SpecCode) %>%
    group_by(SpecCode) %>%
        arrange(SynCode) %>%
        slice_head(n=1) %>%
        ungroup() %>%
    select(-n) %>%
    arrange(SpecCode)


# clean up duplicate synonyms
fishbase.synonyms.syn <- fishbase.synonyms.clean %>% 
    filter(Status=="synonym") %>%
    add_count(synonym) %>%
        #filter(n>1) %>%
        #arrange(synonym,SpecCode,SynCode) %>%
        #print(n=Inf)
    group_by(synonym) %>%
        arrange(SpecCode,SynCode) %>%
        slice_head(n=1) %>%
        ungroup() %>%
    select(-n) %>%
    arrange(SpecCode,synonym)

# clean up and close connection
rm(list=c("fishbase.synonyms","fishbase.synonyms.clean"))
rfishbase::db_disconnect()

# message
writeLines("\nFishBase synonyms loaded")
