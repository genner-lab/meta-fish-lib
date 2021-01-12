#!/usr/bin/env Rscript
# function to load up reference libraries LOCALLY

start_time <- Sys.time()
writeLines("\nLoading reference library locally...")
# load up the species info table
uk.species.table <- vroom::vroom(here("assets","species-table.csv"),delim=",",num_threads=1,guess_max=99999,col_types=cols())
# load up the reference library
reflib.orig <- vroom::vroom(here("assets","reference-library-master.csv.gz"),delim=",",num_threads=1,guess_max=99999,col_types=cols())
# load exclusions file
exclusions <- vroom::vroom(here("assets","exclusions.csv"),delim=",",num_threads=1,guess_max=99999,col_types=cols())
# write encouraging words
end_time <- Sys.time()
writeLines(paste(dim(reflib.orig)[1], "reference sequences loaded in", round(end_time-start_time,digits=1), "seconds"))
writeLines("\nReference library objects are now in your memory")
