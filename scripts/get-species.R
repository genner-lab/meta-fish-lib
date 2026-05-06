#!/usr/bin/env Rscript
# script to make a species and synonym list for a given country  
# scripts/get-species.R -c 826 -s true

# load functions and libs
source(here::here("scripts/load-libs.R"))

# load synonyms from rfishbase
source(here::here("scripts/load-synonyms.R"))

# load fishbase tables
fishbase.country <- suppressMessages(rfishbase::country(server="fishbase",version="23.01"))
fishbase.taxonomy <- suppressMessages(rfishbase::load_taxa(server="fishbase",version="23.01"))
fishbase.species <- suppressMessages(rfishbase::species(server="fishbase",version="23.01"))

# get args
option_list <- list( 
    make_option(c("-c","--country"), type="character"),
    make_option(c("-s","--synonyms"), type="character")
    )

# set args
opt <- optparse::parse_args(optparse::OptionParser(option_list=option_list,add_help_option=FALSE))
# dummy args
#opt <- NULL
#opt$country <- "826" # uk
#opt$country <- "710" # za
#opt$synonyms <- "true"

# status
cli_report(txt="Searching FishBase ...",rule=TRUE,alert="info")


### Species lists

# load countries
# filter on country of interest - use ISO country codes
# ISO country code "826" is "United Kingdom"
# also remove subspecific names
species.list <- fishbase.country %>% 
    dplyr::filter(C_Code==opt$country) %>%
    dplyr::distinct(C_Code,SpecCode,country) %>%
    dplyr::left_join(dplyr::distinct(fishbase.taxonomy,SpecCode,Species),by=join_by(SpecCode))


### Synonyms

# join the countries and synonyms tables
species.list.syn <- species.list %>% dplyr::left_join(dplyr::bind_rows(fishbase.synonyms.acc,fishbase.synonyms.syn),by=join_by(SpecCode))
#species.list.syn %>% print(n=100)


### Taxonomy and common names

# add the taxonomy
species.list.tax <- species.list.syn %>% dplyr::left_join(dplyr::distinct(fishbase.taxonomy,SpecCode,Genus,Family,Order,Class),by=join_by(SpecCode))

# add the common names
species.list.com <- species.list.tax %>% dplyr::left_join(dplyr::distinct(fishbase.species,SpecCode,FBname),by=join_by(SpecCode))


### Format

# format
species.list.form <- species.list.com %>% 
    dplyr::rename(speciesName=synonym,status=Status,fbSpecCode=SpecCode,validName=Species,class=Class,order=Order,family=Family,genus=Genus,commonName=FBname) %>% 
    dplyr::mutate(commonSpecies=TRUE) %>%
    dplyr::relocate(speciesName,status,fbSpecCode,validName,class,order,family,genus,commonName,commonSpecies) %>% 
    dplyr::arrange(class,order,family,genus,validName,status,speciesName) %>%
    dplyr::select(!tidyselect::all_of(c("C_Code","country","SynCode","TaxonLevel")))

# keep or remove synonyms
if(opt$synonyms == "true") {
    species.list.form <- species.list.form
} else if (opt$synonyms == "false") {
    species.list.form <- species.list.form %>% filter(status=="accepted name")
} else stop(cli::cli_alert_danger("'-s' value must be 'true' or 'false'."))


### Clean up and write out
# close connections
#rfishbase::db_disconnect()

# get stats
if(opt$synonyms == "true") {
    acc <- species.list.form %>% dplyr::count(status) %>% dplyr::filter(status=="accepted name") %>% dplyr::pull(n)
    syn <- species.list.form %>% dplyr::count(status) %>% dplyr::filter(status=="synonym") %>% dplyr::pull(n)
} else if (opt$synonyms == "false") {
    acc <- species.list.form %>% dplyr::count(status) %>% dplyr::filter(status=="accepted name") %>% dplyr::pull(n)
    syn <- "0"
} else stop(cli::cli_alert_danger("'-s' value must be 'true' or 'false'."))

# get country name
c.name <- species.list.com %>% dplyr::distinct(country) %>% dplyr::pull(country)

# write out
species.list.form %>% 
    dplyr::filter(!is.na(speciesName)) %>% 
    readr::write_csv(file="assets/species-table.csv")

# print info
cli_report(txt=glue::glue("Writing out species list for country ISO {opt$country}, {c.name}, comprising {acc} accepted names and {syn} synonyms, to 'assets/species-table.csv'"),rule=FALSE,alert="success")

# to give warning if NAs in speciesName
if(nrow(species.list.form) != nrow(filter(species.list.form,!is.na(speciesName)))) {
    cli_report(txt="Warning. The following FishBase species names were removed as NA:",rule=FALSE,alert="info")
    species.list.form %>% 
        dplyr::filter(is.na(speciesName)) %>% 
        dplyr::select(speciesName,fbSpecCode,validName) %>%
        knitr::kable()
}
