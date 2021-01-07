#!/usr/bin/env Rscript

# https://rstudio.github.io/renv/index.html
# initialise renv, install packages, update, snapshot to lock file
# renv::init()
# renv::install(packages=c("tidyverse","vroom","rentrez","bold","traits","rfishbase","ape"))
# renv::update()
# renv::snapshot()

suppressMessages({
    library("parallel")
    library("tidyverse")
    library("magrittr")
    library("vroom")
    library("rentrez")
    library("bold")
    library("traits")
    library("rfishbase")
    library("ape")
})


# FUNCTION FOR MAKING FASTA FILES FROM TABLES
source("https://raw.githubusercontent.com/legalLab/protocols-scripts/master/scripts/tab2fas.R")


# FUNCTION TO RUN PARALLEL ENTREZ SEARCHES 
entrez_search_parallel <- function(query,threads,key){  
    start_time <- Sys.time()
    options("scipen"=100)
    n.res <- suppressWarnings(mcmapply(FUN=function(x) entrez_search(db="nuccore", term=x, retmax=100000, api_key=key, use_history=FALSE), query, SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=threads))
    errs <- grepl("Error",n.res)
    if(any(errs==TRUE)) {
        options("scipen"=100)
        n.res.rep <- suppressWarnings(mcmapply(FUN=function(x) entrez_search(db="nuccore", term=x, retmax=100000, api_key=key, use_history=FALSE), query[which(errs==TRUE)], SIMPLIFY=FALSE, USE.NAMES=FALSE, mc.cores=1))
        n.res[which(errs==TRUE)] <- n.res.rep
    } else {
        n.res <- n.res
    }
    end_time <- Sys.time()
    errs.fin <- grepl("Error",n.res)
    if(any(errs.fin==TRUE)) { 
        stop(writeLines("Searches failed ... aborted")) 
    } else {
        writeLines(paste("Results returned for",length(which(errs.fin==FALSE)), "queries.","Search took",round(as.numeric(end_time-start_time),digits=2),"seconds.",sep=" "))
        return(n.res)
    }
}


# MODIFIED `read.GenBank` FUN INCLUDES API KEY FOR NCBI 
read_GenBank <- function (access.nb, seq.names = access.nb, species.names = TRUE, 
    gene.names = FALSE, as.character = FALSE, api.key) 
{
    N <- length(access.nb)
    a <- 1L
    b <- if (N > 400) 
        400L
    else N
    fl <- tempfile()
    repeat {
        URL <- paste0("https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=", 
            paste(access.nb[a:b], collapse = ","), "&rettype=fasta&retmode=text&api_key=", api.key)
        X <- scan(file = URL, what = "", sep = "\n", quiet = TRUE)
        cat(X, sep = "\n", file = fl, append = TRUE)
        if (b == N) 
            break
        a <- b + 1L
        b <- b + 400L
        if (b > N) 
            b <- N
    }
    res <- read.FASTA(fl)
    if (is.null(res)) 
        return(NULL)
    attr(res, "description") <- names(res)
    if (length(access.nb) != length(res)) {
        names(res) <- gsub("\\..*$", "", names(res))
        failed <- paste(access.nb[!access.nb %in% names(res)], 
            collapse = ", ")
        warning(paste0("cannot get the following sequences:\n", 
            failed))
    }
    else names(res) <- access.nb
    if (as.character) 
        res <- as.character(res)
    if (species.names) {
        a <- 1L
        b <- if (N > 400) 
            400L
        else N
        sp <- character(0)
        repeat {
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
            b <- b + 400L
            if (b > N) 
                b <- N
        }
        attr(res, "species") <- gsub(" ", "_", sp)
    }
    if (gene.names) 
        warning("you used 'gene.names = TRUE': this option is obsolete; please update your code.")
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
    hmm.tbl <- read_delim(file=paste0(dir, "/", prefix, ".hmmer.tbl"), delim=" ", col_names=FALSE, trim_ws=TRUE, progress=FALSE, comment="#", col_types=cols(), guess_max=100000)
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
