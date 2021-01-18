Generating species and synonym lists
================
Rupert A. Collins
18 January 2021


Here is a tutorial for obtaining, annotating, cleaning and formatting a fish species list for a given country. We use the [rfishbase](https://docs.ropensci.org/rfishbase/index.html) package to generate both the list and then augment with data from its numerous tables. The [rgbif](https://docs.ropensci.org/rgbif/index.html) package is also very useful for generating species lists for particular regions.


### Species lists

Use ISO country codes to define countries. These can be found at [en.wikipedia.org/wiki/List_of_ISO_3166_country_codes](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes). 

```r
# load libs
library("tidyverse")
library("rfishbase")

# load countries
# filter on country of interest - use ISO country codes
# ISO country code "826" is "United Kingdom"
# also remove subspecific names
species.list <- rfishbase::country(server="fishbase") %>% 
    filter(C_Code=="826") %>% 
    mutate(Species=paste(str_split_fixed(Species," ",3)[,1],str_split_fixed(Species," ",3)[,2])) %>%
    distinct(SpecCode,Species)
```


### Synonyms

Now we get synonyms for all species in our list. We also clean the table to remove those with unusual, non-alphabetic characters, indicating the name is not a standard format bionomial/trinomial species name. We also remove other types of names (e.g. misapplied names), and also remove any duplicates with >1 accepted scientific name.

```r
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
species.list.syn <- species.list %>% left_join(distinct(fishbase.synonyms.clean,synonym,Status,SpecCode))
```


### Taxonomy and common names

Now we get higher taxonomy and common names and add these fields to the species list.

```r
# load taxonomy and common name tables
fishbase.taxonomy <- rfishbase::load_taxa(server="fishbase")
fishbase.species <- rfishbase::species(server="fishbase")

# add the taxonomy
species.list.tax <- species.list.syn %>% left_join(distinct(fishbase.taxonomy,SpecCode,Genus,Family,Order,Class))

# add the common names
species.list.com <- species.list.tax %>% left_join(distinct(fishbase.species,SpecCode,Species,FBname))
```


### Format and write out

Now we format the species list in the same way as the species list file (`assets/species-table.csv`) in order for it to work in the pipeline. Then we write it out to a CSV formatted file (move it to `assets/species-table.csv` when you are happy with it). The 'commonSpecies' field was set as all 'TRUE', so it you wish to use this feature, then manually change these values in the table at your own discretion.

```r
# format
species.list.form <- species.list.com %>% 
    rename(speciesName=synonym,status=Status,fbSpecCode=SpecCode,validName=Species,class=Class,order=Order,family=Family,genus=Genus,commonName=FBname) %>% 
    mutate(commonSpecies=TRUE) %>%
    relocate(speciesName,status,fbSpecCode,validName,class,order,family,genus,commonName,commonSpecies) %>% 
    arrange(class,order,family,genus,validName,status,speciesName) 

# write out
species.list.form %>% write_csv(file="species-table.csv")
```
