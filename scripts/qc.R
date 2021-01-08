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


## Set up the markers 

# make a copy so don't have to reload orig
reflib <- reflib.orig

# get the prefixes 
prefixes <- reflib.orig %>% select(starts_with("nucleotidesFrag")) %>% names() %>% str_replace_all("nucleotidesFrag\\.","")

# subset each marker
reflibs.sub <- mcmapply(function(x) subset_nucs(pref=x,df=reflib), prefixes, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)


## Stats on seq lengths

# plot the length distributions
# choose a marker - do manually per marker
#print(prefixes)
#reflib.tmp <- reflibs.sub[[1]]
reflib.tmp %>% ggplot(aes(lengthFrag)) + geom_histogram(binwidth=1)

# make a dataframe of trimming stats
trimming.df <- tibble(percMed=seq(0,1,by=0.05), 
    bp=sapply(seq(0,1,by=0.05), function(x) round(median(pull(reflib.tmp,lengthFrag))*x)),
    speciesLost=sapply(seq(0,1,by=0.05), function(x) length(species_lost(df=reflib.tmp,thresh=x))),
    seqsRemoved=sapply(seq(0,1,by=0.05), function(x) sequences_removed(df=reflib.tmp,thresh=x)))

# print trim results
trimming.df %>% print(n=Inf)

# look at lost species at each value
lsp <- sapply(seq(0,1,by=0.05), function(x) species_lost(df=reflib.tmp,thresh=x))
names(lsp) <- paste0((seq(0,1,by=0.05)*100), "% of median seq len")
print(lsp)


## Make haplotype trees

# collapse dataframe by haps-per-species, annotate with number haps
reflibs.haps <- mcmapply(function(x) haps2fas(df=x), reflibs.sub, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)

# convert to fasta
reflibs.fas <- mcmapply(function(x) tab2fas(df=x,seqcol="nucleotidesFrag",namecol="noms"), reflibs.haps, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)

# make trees for each marker - may take up to 5 h for the biggest COI tree
# outputs into '/temp/qc_GBVERSION_MONTH-YEAR' --- careful if running overnight when months change!
trs.list <- mcmapply(function(x,y) phylogenize(fas=x, prefix=y, binLoc="~/Software/standard-RAxML/raxmlHPC-AVX", version=gb.version), reflibs.fas, prefixes, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)

# plot the trees in a temp dir
mcmapply(function(x,y,z) plot_trees(tr=x, df=y, prefix=z, version=gb.version), trs.list, reflibs.haps, prefixes, SIMPLIFY=FALSE,USE.NAMES=TRUE,mc.cores=cores)
