#!/usr/bin/env Rscript
# script to quality control the reference libraries and identify erroneous sequences.

# load functions and libs
source("scripts/load-libs.R")
source("scripts/references-load.R")
# load stats
stats <-suppressMessages(read_csv("reports/stats.csv"))
gb.version <- stats %>% filter(stat=="genbankVersion") %>% pull(n)

# set cores
cores <- 8

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

# make trees for each marker - may take up to 5 h for the biggest COI tree
# outputs into '/temp/qc_GBVERSION_MONTH-YEAR' --- careful if running overnight when months change!
trs.list <- mcmapply(function(x,y) phylogenize(fas=x, prefix=y, binLoc="~/Software/standard-RAxML/raxmlHPC-AVX", version=gb.version), reflibs.fas, prefixes, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)

# plot the trees in a temp dir
mcmapply(function(x,y,z) plot_trees(tr=x, df=y, prefix=z, version=gb.version), trs.list, reflibs.haps, prefixes, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)
