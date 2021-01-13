#!/usr/bin/env Rscript
# Rupert A. Collins

# R script to check genbank version against previous versions

# load functions and libs
capture.output(source(here::here("scripts","load-libs.R")),file="/dev/null")

# load REMOTE reference library copy and print
capture.output(source(here("scripts","references-load-remote.R")),file="/dev/null")
writeLines(paste0("\nRemote (GitHub) reference library is at GenBank version ",gbv," (accessed ",gbd,")."))

# load LOCAL reference library copy and print
capture.output(source(here("scripts","references-load-local.R")),file="/dev/null")
writeLines(paste0("\nLocal reference library is at GenBank version ",gbv," (accessed ",gbd,")."))

# load GenBank version and print
gb.version <- read.table("ftp://ftp.ncbi.nih.gov/genbank/GB_Release_Number")$V1
writeLines(paste0("\nNCBI GenBank is currently at version ",gb.version," (accessed ",format(Sys.time(), '%d %b %Y'),").\n"))
