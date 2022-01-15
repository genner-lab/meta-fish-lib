#!/usr/bin/env Rscript

# https://rstudio.github.io/renv/index.html
# initialise renv, install packages, update, snapshot to lock file
# renv::init()
# renv::install(packages=c("",""))
# renv::update()
# renv::snapshot()

suppressMessages({
    library("here")
    library("parallel")
    library("optparse")
    library("tidyverse")
    library("magrittr")
    library("lubridate")
    library("rentrez")
    library("bold")
    library("traits")
    library("rfishbase")
    library("ape")
    library("ips")
    library("phangorn")
    library("spider")
    library("rmarkdown")
    library("knitr")
})


# FUNCTION FOR MAKING FASTA FILES FROM TABLES
source("https://raw.githubusercontent.com/legalLab/protocols-scripts/master/scripts/tab2fas.R")


# FUNCTION TO RUN PARALLEL ENTREZ SEARCHES 
entrez_search_parallel <- function(query,threads,key){  
    start_time <- Sys.time()
    n.res <- suppressWarnings(mcmapply(FUN=function(x) entrez_search(db="nuccore", term=x, retmax=as.integer(99999), api_key=key, use_history=TRUE), query, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=threads))
    errs <- grepl("Error",n.res)
    if(any(errs==TRUE)) {
        n.res.rep <- suppressWarnings(mcmapply(FUN=function(x) entrez_search(db="nuccore", term=x, retmax=as.integer(99999), api_key=key, use_history=TRUE), query[which(errs==TRUE)], SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=1))
        n.res[which(errs==TRUE)] <- n.res.rep
    } else {
        n.res <- n.res
    }
    end_time <- Sys.time()
    errs.fin <- grepl("Error",n.res)
    if(any(errs.fin==TRUE)) { 
        stop(writeLines("Searches failed ... aborted")) 
    } else {
        writeLines(paste("Results returned for",length(which(errs.fin==FALSE)), "batches.","Search took",round(as.numeric(end_time-start_time),digits=2),"seconds.",sep=" "))
        return(n.res)
    }
}


# FUNCTION TO RUN PARALLEL ENTREZ FETCH 
entrez_fetch_parallel <- function(search,key){
    start_time <- Sys.time()
    fas.path <- here("temp/fasta-temp",paste0(search$web_history$WebEnv,".fas"))
    Sys.sleep(time=runif(n=1,min=0,max=2))
        for(i in seq(0,search$count,as.integer(9999))){
        n.res <- entrez_fetch(db="nuccore",web_history=search$web_history,retstart=i,retmax=as.integer(9999),rettype="fasta",api_key=key)
        write(n.res,file=fas.path,append=TRUE)
        }
    end_time <- Sys.time()
    writeLines(paste("Query",search$web_history$WebEnv,"written to file.","Download took",round(as.numeric(end_time-start_time),digits=2),"seconds.",sep=" "))
}


# FUNCTION TO RUN PARALLEL BOLD WITH TIMEOUT
bold_seqspec_timer <- function(species){
    start.time.bold <- Sys.time()
    Sys.sleep(time=sample(seq(from=0,to=5,by=0.1),1))
    bold.res <- bold::bold_seqspec(species,format="tsv",sepfasta=FALSE,response=FALSE)
    end.time.bold <- Sys.time()
    if(class(bold.res)=="data.frame"){
    writeLines(paste(nrow(bold.res),"records for",length(unique(pull(bold.res,species_name))),"species downloaded from BOLD.","Download took",round(as.numeric(end.time.bold-start.time.bold, units="mins"),digits=2),"minutes.",sep=" "))
    } else {writeLines("No records found.")}
    return(bold.res)
}


# MODIFIED `read.GenBank` FUN INCLUDES API KEY FOR NCBI 
read_GenBank <- function (access.nb, seq.names = access.nb, species.names = FALSE, 
    as.character = FALSE, chunk.size = 200, quiet = FALSE, api.key) 
{
    chunk.size <- as.integer(chunk.size)
    N <- length(access.nb)
    a <- 1L
    b <- if (N > chunk.size) 
        chunk.size
    else N
    fl <- paste0(tempfile(pattern=paste0(access.nb[1],"_"),tmpdir=here::here("temp/fasta-temp")), ".fas")
    if (!quiet) 
        #cat("Note: chunk.size =", chunk.size, "(max nb of sequences downloaded together)\n")
    repeat {
        if (!quiet) 
            cat("\rDownloading sequences:", b, "/", N, "...")
        URL <- paste0("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=", 
            paste(access.nb[a:b], collapse = ","), "&rettype=fasta&retmode=text&api_key=", api.key)
        X <- scan(file = URL, what = "", sep = "\n", quiet = TRUE)
        cat(X, sep = "\n", file = fl, append = TRUE)
        if (b == N) 
            break
        a <- b + 1L
        b <- b + chunk.size
        if (b > N) 
            b <- N
    }
    if (!quiet) {
        cat(" Done.")
        #cat("\nReading sequences...")
    }
    res <- read.FASTA(fl)
    if (is.null(res)) 
        return(NULL)
    attr(res, "description") <- names(res)
    if (length(access.nb) != length(res)) {
        names(res) <- gsub("\\..*$", "", names(res))
        failed <- paste(access.nb[!access.nb %in% names(res)], 
            collapse = ", ")
        warning(paste0("cannot get the following sequence(s):\n", 
            failed))
    }
    else names(res) <- access.nb
    if (as.character) 
        res <- as.character(res)
    if (!quiet) 
        cat("\n")
    if (species.names) {
        a <- 1L
        b <- if (N > chunk.size) 
            chunk.size
        else N
        sp <- character(0)
        repeat {
            if (!quiet) 
                cat("\rDownloading species names:", b, "/", N)
            URL <- paste("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=", 
                paste(access.nb[a:b], collapse = ","), "&rettype=gb&retmode=text&api_key=", api.key,
                sep = "")
            X <- scan(file = URL, what = "", sep = "\n", quiet = TRUE, 
                n = -1)
            sp <- c(sp, gsub(" +ORGANISM +", "", grep("ORGANISM", 
                X, value = TRUE)))
            if (b == N) 
                break
            a <- b + 1L
            b <- b + chunk.size
            if (b > N) 
                b <- N
        }
        if (!quiet) 
            cat(".\n")
        attr(res, "species") <- gsub(" ", "_", sp)
    }
    Sys.sleep(time=runif(n=1,min=0,max=2))
    res
}



# R script to run a hidden markov model on a sequence
# need to have "hmmer" and "biosquid" installed 
# if not, run 'sudo apt install hmmer biosquid'
# also needs the ape package
# requires a tempfile directory (e.g. "temp")
# requires an infile in fasta format to be in the same dir as the tempfiles (e.g. "myfile.fas")
# requires the name of the hmm you want to use (e.g. "12s.miya.noprimers.hmm")
# requires a prefix for the hmmer output (e.g. "analysis1")
# assumes the hidden markov model is located in hmms 
# returns a DNAbin object of the sequences matched by hmmer 

run_hmmer3 <- function(dir, infile, hmm, prefix, evalue, coords){#
    string.hmmer <- paste0("nhmmer -E ", evalue, " --incE ", evalue, " --dfamtblout ", dir, "/", prefix, ".hmmer.tbl ", "assets/hmms/", prefix, ".hmm ", dir, "/", infile)
    system(command=string.hmmer, ignore.stdout=TRUE)
    hmm.tbl <- readr::read_table(file=paste0(dir, "/", prefix, ".hmmer.tbl"), col_names=FALSE, progress=FALSE, comment="#", col_types=cols(), guess_max=100000)
    names(hmm.tbl) <- c("targetName","acc","queryName","bits","eValue","bias","hmmStart","hmmEnd","strand","aliStart","aliEnd","envStart","envEnd","sqLen","descriptionTarget")
    hmm.tbl %<>% filter(strand=="+") %>% distinct(targetName, .keep_all=TRUE) %>% mutate(coords=paste(envStart,envEnd,sep=":"))
    mtdna <- read.FASTA(file=paste0(dir,"/",infile))
    mtdna.sub <- as.character(mtdna[match(hmm.tbl$targetName,names(mtdna))])
    if(coords=="env"){
    mtdna.sub.coords <- as.DNAbin(mapply(function(x,y,z) x[y:z], mtdna.sub, hmm.tbl$envStart, hmm.tbl$envEnd, SIMPLIFY=TRUE, USE.NAMES=TRUE))
    } else if(coords=="ali"){
    mtdna.sub.coords <- as.DNAbin(mapply(function(x,y,z) x[y:z], mtdna.sub, hmm.tbl$aliStart, hmm.tbl$aliEnd, SIMPLIFY=TRUE, USE.NAMES=TRUE))
    } else {
    stop("Please provide 'env' or 'ali' as arguments to coords")
    }
    return(mtdna.sub.coords)
}


# FUN TO SUBSET A REFERENCE LIB FOR EACH MARKER
subset_nucs <- function(pref,df){
    df %<>% rename(nucleotidesFrag=!!as.name(paste0("nucleotidesFrag.",pref)), lengthFrag=!!as.name(paste0("lengthFrag.",pref)))
    df %<>% filter(!is.na(nucleotidesFrag))
    return(df)
}


# FUNCTION TO CALCULATE SPECIES THAT DROP OUT OF A DATASET AFTER LENGTH TRIMMING
# species_lost(df=reflib,thresh=0.5)
# threshold is a proportion of the mean sequence length
species_lost <- function(df,thresh){
    removed <- df %>% filter(lengthFrag < (median(lengthFrag)*thresh)) %>% select(sciNameValid)
    kept <- df %>% filter(lengthFrag >= (median(lengthFrag)*thresh)) %>% select(sciNameValid)
    tot <- setdiff(removed$sciNameValid, kept$sciNameValid)
    return(tot)
}


# FUNCTION TO CALCULATE SEQUENCES REMOVED FROM A DATASET AFTER LENGTH TRIMMING
# sequences_removed(df=reflib,thresh=0.5)
# threshold is a proportion of the mean sequence length
sequences_removed <- function(df,thresh){
    removed <- df %>% filter(lengthFrag < (median(lengthFrag)*thresh)) %>% select(dbid)
    n.removed <- length(removed$dbid)
    return(n.removed)
}


# COLLAPSES HAPLOTYPES (FROM A DATAFRAME FORMAT TO A DATAFRAME FORMAT)
# need to specify columns that contain sequence lengths, and nucleotides
# hap_collapse_df(df=mydataframe,lengthcol="lengthFrag",nuccol="nucleotidesFrag")
# add a number of each haplotype
hap_collapse_df <- function(df,lengthcol,nuccol,cores){
    odf <- df[order(df[[lengthcol]],decreasing=TRUE),]
    reps <- mcmapply(FUN=function(x) which(str_detect(string=odf[[nuccol]], pattern=x) == TRUE)[1], odf[[nuccol]], SIMPLIFY=TRUE, USE.NAMES=FALSE, mc.cores=cores)
    ind <- unique(reps)
    dat <- odf[ind,]
    dat[["nHaps"]] <- as.numeric(table(reps))
    return(dat)
}


# FUNCTION TO GET RETRIEVE SPECIES NAMES OF SEQUENCES WITH AN IDENTICAL HAPLOTYPE AS YOUR QUERY 
# works on a dataframe
# get_sames(df=mydataframe,ids="dbid",nucs="nucleotidesFrag",sppVec="sciNameValid",query=mydataframe$nucleotidesFrag[[1]])
get_sames <- function(df,ids,nucs,sppVec,query){
    per.ind <- df[[sppVec]][str_detect(df[[nucs]], query)]
    return(per.ind)
}


# FUN TO ANNOTATE A REFERENCE LIBRARY TABLE WITH NUMBER HAPLOTYPES PER SPECIES
haps2fas <- function(df){
    df <- bind_rows(mcmapply(FUN=function(x) hap_collapse_df(df=x,lengthcol="lengthFrag",nuccol="nucleotidesFrag",cores=1), split(df,pull(df,sciNameValid)), SIMPLIFY=FALSE,mc.cores=1))
    sames <- mclapply(FUN=function(x) get_sames(df=df,ids="dbid",nucs="nucleotidesFrag",sppVec="sciNameValid",query=x), pull(df,nucleotidesFrag), mc.cores=1)
    df %<>% mutate(nMatches=sapply(sames, function(x) length(unique(x))), matchTax=sapply(sames, function(x) paste(unique(x),collapse=" | ")))
    df %<>% mutate(noms=paste(dbid,str_replace_all(sciNameValid," |:|'","_"),nHaps,sep="|")) %>% arrange(class,order,family,genus,sciNameValid,lengthFrag,dbid)
    return(df)
}


# NEW RAXML-NG FUN
raxml_ng <- function(file,verbose) {
    if(verbose == "true") {
        string.mafft <- paste0("mafft --thread -1 --maxiterate 2 --retree 2 ",file," > ",file,".ali")
        system(command=string.mafft,ignore.stdout=FALSE)
        string.parse <- paste0("raxml-ng --parse --msa ",file,".ali --model TN93+F+G --seed 42 --redo --threads auto")
        system(command=string.parse,ignore.stdout=FALSE)
        string.search <- paste0("raxml-ng --search --msa ",file,".ali.raxml.rba --tree pars{1} --rate-scalers off --seed 42 --redo --threads auto")
        system(command=string.search,ignore.stdout=FALSE)
        rax.tr <- ape::read.tree(file=paste0(file,".ali.raxml.rba.raxml.bestTree"))
    } else if (verbose == "false") {
        string.mafft <- paste0("mafft --quiet --thread -1 --maxiterate 2 --retree 2 ",file," > ",file,".ali")
        system(command=string.mafft,ignore.stdout=FALSE)
        string.parse <- paste0("raxml-ng --parse --msa ",file,".ali --model TN93+F+G --seed 42 --redo --threads auto")
        system(command=string.parse,ignore.stdout=TRUE)
        string.search <- paste0("raxml-ng --search --msa ",file,".ali.raxml.rba --tree pars{1} --rate-scalers off --seed 42 --redo --threads auto")
        system(command=string.search,ignore.stdout=TRUE)
        rax.tr <- ape::read.tree(file=paste0(file,".ali.raxml.rba.raxml.bestTree"))
    } else stop(writeLines("'-v' value must be 'true' or 'false'."))
    return(rax.tr)
}


# FUN TO ALIGN SEQS AND MAKE A PHYLOGENETIC TREE
phylogenize <- function(dir,fas,prefix,verbose){
    file.fas <- here("temp",dir,paste0(prefix,".fas"))
    ape::write.FASTA(fas,file=file.fas)
    tr <- raxml_ng(file=file.fas,verbose=verbose)
    return(tr)
}


# FUN TO PLOT AND ANNOTATE PHYLOGENETIC TREES
plot_trees <- function(tr,df,prefix,version){
    tr <- ape::ladderize(phangorn::midpoint(tr))
    sppv <- pull(df,sciNameValid)[match(str_split_fixed(tr$tip.label,"\\|",3)[,1],pull(df,dbid))]
    monov <- spider::monophyly(tr,sppVector=sppv)
    allmono <- monov[match(sppv, unique(sppv))]
    cols <- rep("gray20",length(tr$tip.label))
    cols[which(allmono==FALSE)] <- "hotpink"
    cols[match(df$noms[which(df$nMatches>1)], tr$tip.label)] <- "green3"
    tmp.path <- paste0("reports/qc_v",version,"_",paste(month(ymd(Sys.Date()),label=TRUE),year(ymd(Sys.Date())),sep="-"))
    if(!dir.exists(here(tmp.path))){
        dir.create(here(tmp.path))
        }
    dfs <- df %>% summarise(nSeqs=sum(nHaps),nHaps=length(nHaps),nSpp=length(unique(sciNameValid)))
    tit <- paste0(str_replace_all(prefix,"\\.noprimers",""),"\n(n=",pull(dfs,nSeqs),", n haplotypes=",pull(dfs,nHaps),", n spp.=",pull(dfs,nSpp),")\nlabel format = 'dbid|Genus species|n haplotypes'\npink = non-monophyletic species\ngreen = shared haplotypes\nscroll down for tree ...")
    pdf(file=paste0(tmp.path,"/RAxML_bestTree.",prefix,".pdf"), width=15, height=length(tr$tip.label)/10)
    plot.phylo(tr, tip.col=cols, cex=0.5, font=1, label.offset=0.01, no.margin=TRUE)
    title(tit, line=-10)
    dev.off()
}

# message
writeLines("\nPackages and functions loaded")
