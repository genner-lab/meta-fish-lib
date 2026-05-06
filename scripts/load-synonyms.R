#!/usr/bin/env Rscript

# R script to retrieve and clean synonyms from rfishbase

# get up to date spp list and taxonomy
fishbase.synonyms <- rfishbase::synonyms(server="fishbase",version="23.05")

# clean up synonyms table - just accepted names and synonyms
fishbase.synonyms.clean <- fishbase.synonyms %>% 
    dplyr::select(!tidyselect::all_of(c("CoL_ID","TSN","WoRMS_ID","ZooBank_ID"))) %>%
    dplyr::mutate(Status=stringr::str_replace_all(Status,"^Synonym","synonym")) %>%
    dplyr::mutate(Status=stringr::str_replace_all(Status,"^provisionally accepted name","accepted name")) %>%
    dplyr::mutate(Status=stringr::str_replace_all(Status,"^ambiguous synonym","synonym")) %>%
    dplyr::mutate(TaxonLevel=stringr::str_replace_all(TaxonLevel,"^species","Species")) %>%
    dplyr::mutate(TaxonLevel=stringr::str_replace_all(TaxonLevel,"^subspecies","Subspecies")) %>%
    dplyr::mutate(TaxonLevel=stringr::str_replace_all(TaxonLevel,"^Nominotypical","Subspecies")) %>%
    dplyr::filter(Status=="synonym" | Status=="accepted name") %>%
    dplyr::filter(TaxonLevel=="Species" | TaxonLevel=="Subspecies") %>%
    dplyr::filter(SpecCode!=0) %>% 
    dplyr::filter(!stringr::str_detect(synonym,"[^a-zA-Z\\d\\s:]"))

# clean up duplicate accepted names
fishbase.synonyms.acc <- fishbase.synonyms.clean %>%
    dplyr::filter(Status=="accepted name" & TaxonLevel =="Species") %>%
    dplyr::add_count(SpecCode) %>%
    dplyr::group_by(SpecCode) %>%
        dplyr::arrange(SynCode) %>%
        dplyr::slice_head(n=1) %>%
        dplyr::ungroup() %>%
    dplyr::select(-n) %>%
    dplyr::arrange(SpecCode)


# clean up duplicate synonyms
fishbase.synonyms.syn <- fishbase.synonyms.clean %>% 
    dplyr::filter(Status=="synonym") %>%
    dplyr::add_count(synonym) %>%
    dplyr::group_by(synonym) %>%
        dplyr::arrange(SpecCode,SynCode) %>%
        dplyr::slice_head(n=1) %>%
        dplyr::ungroup() %>%
    dplyr::select(-n) %>%
    dplyr::arrange(SpecCode,synonym)

# clean up and close connection
rm(list=c("fishbase.synonyms","fishbase.synonyms.clean"))

# report
cli_report(txt="FishBase synonyms loaded.",rule=FALSE,alert="success")
