#!/usr/bin/env Rscript
# Rupert A. Collins

# R script to check genbank version against previous versions

# load functions and libs
capture.output(source(here::here("scripts","load-libs.R")),file="/dev/null")

# load REMOTE reference library copy and print
capture.output(source(here::here("scripts","references-load-remote.R")),file="/dev/null")
cli_report(txt=glue::glue("Remote (GitHub) reference library is at GenBank version {gbv} (accessed {gbd})."),rule=FALSE,alert="info")


# load LOCAL reference library copy and print
capture.output(source(here::here("scripts","references-load-local.R")),file="/dev/null")
cli_report(txt=glue::glue("Local reference library is at GenBank version {gbv} (accessed {gbd})."),rule=FALSE,alert="info")


# load GenBank version and print
gb.version <- read.table("https://ftp.ncbi.nih.gov/genbank/GB_Release_Number")$V1
cli_report(txt=glue::glue("NCBI GenBank is currently at version {gb.version} (accessed {format(Sys.time(), '%d %b %Y')})."),rule=FALSE,alert="info")
