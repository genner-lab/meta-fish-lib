#!/usr/bin/env Rscript
# script to dereplicate local reference libraries and write out fasta files in various formats
# scripts/derep-write-fasta.R -m 12s.miya -d true -p 0.5

# load functions and libs
source(here::here("scripts","load-libs.R"))
source(here::here("scripts","references-load-local.R"))
source(here::here("scripts","references-clean.R"))

# make outdir
if(!dir.exists(here("assets/fasta"))){
    dir.create(here("assets/fasta"))
}

# get args
option_list <- list( 
    make_option(c("-m","--metabarcode"), type="character"),
    make_option(c("-d","--derep"), type="character"),
    make_option(c("-p","--proplen"), type="numeric")
    )
# set args
opt <- parse_args(OptionParser(option_list=option_list,add_help_option=FALSE))

# dummy args
#opt <- NULL
#opt$proplen <- 0.9
#opt$metabarcode <- "12s.miya"
#opt$derep <- "true"

# subset FRAG
reflib.cleaned.sub <- subset_references(df=reflib.cleaned,metabarcode=opt$metabarcode)

# choose metabarcode
if(opt$derep == "true") {
    reflib.cleaned.sub.haps <- derep_filter(df=reflib.cleaned.sub, derep=TRUE, proplen=0)
} else if (opt$derep == "false") {
    reflib.cleaned.sub.haps <- derep_filter(df=reflib.cleaned.sub, derep=FALSE, proplen=0) %>% mutate(nHaps=NA)
} else stop(writeLines("'-d' value must be 'true' or 'false'."))

# filter by median length
reflib.cleaned.sub.haps.filt <- reflib.cleaned.sub.haps %>% filter(length >= (median(length)*opt$proplen))

# get seqs/spp lost
seqs.lost <- sequences_removed(df=reflib.cleaned.sub.haps,thresh=opt$proplen)
spp.lost <- length(species_lost(df=reflib.cleaned.sub.haps,thresh=opt$proplen))
#print(seqs.lost)
#print(spp.lost)

# write out
write_references_fasta(df=reflib.cleaned.sub.haps.filt,path=here("assets/fasta"))

# print info
writeLines(paste0("\nReference library comprising ",dim(reflib.cleaned.sub.haps.filt)[1]," sequences has been written to 'assets/fasta' in FASTA and CSV formats.\nDuring length filtering at ",opt$proplen*100,"% of median sequence length, a total of ",seqs.lost," sequences and ",spp.lost," species were removed.\n"))
