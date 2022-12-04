#!/usr/bin/env Rscript
# function to load up reference libraries REMOTELY

start_time <- Sys.time()
writeLines("\nLoading reference library remotely...")
# load up the species info table
#uk.species.table <- vroom::vroom("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/species-table.csv",delim=",",num_threads=1,guess_max=99999,col_types=cols())
uk.species.table <- readr::read_csv("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/species-table.csv",guess_max=99999,col_types=cols())
# load up the reference library and get version and dates
#reflib.orig <- vroom::vroom("https://github.com/genner-lab/meta-fish-lib/raw/main/assets/reference-library-master.csv.gz",delim=",",num_threads=1,guess_max=99999,col_types=cols())
reflib.orig <- readr::read_csv("https://github.com/genner-lab/meta-fish-lib/raw/main/assets/reference-library-master.csv.gz",guess_max=99999,col_types=cols())
gbv <- reflib.orig %>% dplyr::select(genbankVersion) %>% tidyr::drop_na() %>% dplyr::distinct(genbankVersion) %>% dplyr::pull(genbankVersion)
gbd <- reflib.orig %>% dplyr::select(searchDate) %>% tidyr::drop_na() %>% dplyr::distinct(searchDate) %>% dplyr::pull(searchDate)
# load exclusions file
#exclusions <- vroom::vroom("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/exclusions.csv",delim=",",num_threads=1,guess_max=99999,col_types=cols())
exclusions <- readr::read_csv("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/exclusions.csv",guess_max=99999,col_types=cols())
# taxonomic changes
taxonomy.changes <- readr::read_csv("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/assets/taxonomy-changes.csv",guess_max=99999,col_types=cols())
# write encouraging words
end_time <- Sys.time()
writeLines(paste(dim(reflib.orig)[1], "reference sequences loaded in", round(end_time-start_time,digits=1), "seconds"))
writeLines(paste0("\nGenBank version ", gbv, ", searched ",gbd))
writeLines("\nReference library objects are now in your memory\n")
