#!/usr/bin/env Rscript
# script to quality control the reference libraries and identify erroneous sequences.

# get args
args <- commandArgs(trailingOnly=TRUE)

# load functions and libs
source(here::here("scripts","load-libs.R"))
source(here::here("scripts","references-load-local.R"))
source(here::here("scripts","references-clean.R"))

# load stats
stats <-suppressMessages(read_csv(here("reports","stats.csv")))
gb.version <- stats %>% filter(stat=="genbankVersion") %>% pull(n)

# message 
writeLines("\nGenerating phylogenetic trees, may take many hours ...")

# set cores
cores <- args[2]

# make a copy so don't have to reload orig
reflib <- reflib.orig

# get the prefixes 
prefixes <- reflib.orig %>% select(starts_with("nucleotidesFrag")) %>% names() %>% str_replace_all("nucleotidesFrag\\.","")

# subset each marker
reflibs.sub <- mcmapply(function(x) subset_nucs(pref=x,df=reflib), prefixes, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)

# collapse dataframe by haps-per-species, annotate with number haps
reflibs.haps <- mcmapply(function(x) haps2fas(df=x), reflibs.sub, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)

# convert to fasta
reflibs.fas <- mcmapply(function(x) tab2fas(df=x,seqcol="nucleotidesFrag",namecol="noms"), reflibs.haps, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)

# make trees for each marker - may take up to 6 h for the biggest COI tree
# outputs into 'temp/qc_GBVERSION_MONTH-YEAR' --- careful if running overnight when months change!
setwd(here("temp"))
trs.list <- mcmapply(function(x,y) phylogenize(fas=x, prefix=y, binLoc=args[1], version=gb.version), reflibs.fas, prefixes, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)
setwd(here())

# plot the trees in a temp dir
mcmapply(function(x,y,z) plot_trees(tr=x, df=y, prefix=z, version=gb.version), trs.list, reflibs.haps, prefixes, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)

writeLines("\nPhylogenetic trees have been generated, PDFs are available in 'reports/qc_GBVERSION_MONTH-YEAR'")
