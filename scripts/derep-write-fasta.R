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
reflib.cleaned.sub <- subset_references(df=reflib.cleaned,frag=opt$metabarcode)

# choose metabarcode
if(opt$derep == "true") {
    reflib.cleaned.sub.haps <- reflib.cleaned.sub %>% 
        group_by(sciNameValid) %>% 
        group_modify(~ hap_collapse_df(df=.x,lengthcol="length",nuccol="nucleotides",cores=1)) %>% 
        ungroup() 
} else if (opt$derep == "false") {
    reflib.cleaned.sub.haps <- reflib.cleaned.sub
} else stop(writeLines("'-d' value must be 'true' or 'false'."))

# filter by median length
reflib.cleaned.sub.haps.filt <- reflib.cleaned.sub.haps %>% filter(length >= (median(length)*opt$proplen))

# get seqs/spp lost
seqs.lost <- sequences_removed(df=reflib.cleaned.sub.haps,thresh=opt$proplen)
spp.lost <- length(species_lost(df=reflib.cleaned.sub.haps,thresh=opt$proplen))

# create labels
reflib.cleaned.sub.haps.filt.labs <- reflib.cleaned.sub.haps.filt %>% 
    mutate(kingdom="Animalia") %>%
    arrange(kingdom,phylum,class,order,family,genus,sciNameValid,dbid) %>% 
    mutate(labelSintax=paste0(dbid,";tax=k:",kingdom,",p:",phylum,",c:",class,",o:",order,",f:",family,",g:",genus,",s:",sciNameValid)) %>% 
    mutate(labelSintax=str_replace_all(labelSintax," ","_")) %>%
    mutate(labelDadaTaxonomy=paste0(phylum,";",class,";",order,";",family,";",genus,";",sciNameValid,";")) %>%
    mutate(labelDadaSpecies=paste(dbid,str_split_fixed(sciNameValid," ",2)[,1],str_split_fixed(sciNameValid," ",2)[,2]))

# get version
gbv <- paste0("v",unique(pull(reflib.cleaned.sub.haps.filt,genbankVersion)))

# convert to fasta file and write out all formatted fasta file
ape::write.FASTA(tab2fas(df=reflib.cleaned.sub.haps.filt.labs, seqcol="nucleotides", namecol="dbid"), file=here("assets","fasta",paste("references",opt$metabarcode,"dbid",gbv,"fasta",sep=".")))
ape::write.FASTA(tab2fas(df=reflib.cleaned.sub.haps.filt.labs, seqcol="nucleotides", namecol="labelSintax"), file=here("assets","fasta",paste("references",opt$metabarcode,"sintax",gbv,"fasta",sep=".")))
ape::write.FASTA(tab2fas(df=reflib.cleaned.sub.haps.filt.labs, seqcol="nucleotides", namecol="labelDadaTaxonomy"), file=here("assets","fasta",paste("references",opt$metabarcode,"dada.taxonomy",gbv,"fasta",sep=".")))
ape::write.FASTA(tab2fas(df=reflib.cleaned.sub.haps.filt.labs, seqcol="nucleotides", namecol="labelDadaSpecies"), file=here("assets","fasta",paste("references",opt$metabarcode,"dada.species",gbv,"fasta",sep=".")))

# print info
writeLines(paste0("\nReference library has been written to 'assets/fasta' in FASTA formats.\nDuring length filtering at ",opt$proplen*100,"% of median sequence length, a total of ",seqs.lost," sequences and ",spp.lost," species were removed.\n"))
