#!/usr/bin/env Rscript
# function to load up reference libraries REMOTELY

start_time <- Sys.time()
cli_report(txt="Loading reference library remotely ...",rule=FALSE,alert="info")
# load up the species info table
uk.species.table <- readr::read_csv("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/species-table.csv",guess_max=99999,col_types=cols())
# load up the reference library and get version and dates
reflib.orig <- readr::read_csv("https://github.com/genner-lab/meta-fish-lib/raw/main/assets/reference-library-master.csv.gz",guess_max=99999,col_types=cols())
gbv <- reflib.orig %>% dplyr::select(genbankVersion) %>% tidyr::drop_na() %>% dplyr::distinct(genbankVersion) %>% dplyr::pull(genbankVersion)
gbd <- reflib.orig %>% dplyr::select(searchDate) %>% tidyr::drop_na() %>% dplyr::distinct(searchDate) %>% dplyr::pull(searchDate)
# load exclusions file
exclusions <- readr::read_csv("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/exclusions.csv",guess_max=99999,col_types=cols())
# taxonomic changes
taxonomy.changes <- readr::read_csv("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/taxonomy-changes.csv",guess_max=99999,col_types=cols())
# write encouraging words
end_time <- Sys.time()
cli_report(txt=glue::glue("{dim(reflib.orig)[1]} reference sequences loaded in {round(end_time-start_time,digits=1)} seconds."),rule=FALSE,alert="success")
cli_report(txt=glue::glue("GenBank version {gbv}, searched {gbd}."),rule=FALSE,alert="info")
cli_report(txt="Reference library objects are now in your memory.",rule=FALSE,alert="success")
