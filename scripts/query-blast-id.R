#!/usr/bin/env Rscript
options(width=180)
# R script to blast a sequence
# scripts/query-blast-id.R  -t 2 -d qc_v270_Mar-2026 -m coi.ward -q 694174326

# libs
writeLines("\nLoading local reference library ...\n")
source(here::here("scripts/load-libs.R"))
source(here::here("scripts/references-load-local.R"))
source(here::here("scripts/references-clean.R"))

# get args
option_list <- list(
    make_option(c("-t","--threads"), type="numeric"),
    make_option(c("-d","--directory"), type="character"),
    make_option(c("-m","--metabarcode"), type="character"),
    make_option(c("-q","--query"), type="character")
    )

# set args
opt <- parse_args(OptionParser(option_list=option_list,add_help_option=FALSE))

# opts if running line-by-line
#opt <- NULL
#opt$directory <- "qc_v270_Mar-2026"
#opt$threads <- 1
#opt$metabarcode <- "coi.ward"
#opt$query <- "694174326"


# clean and subset refs
reflib.sub <- subset_nucs(pref=glue::glue("{opt$metabarcode}.noprimers"),df=reflib.cleaned)

# write query
reflib.sub |> 
    filter(dbid==opt$query) |> 
    tab2fas(seqcol="nucleotidesFrag",namecol="dbid") |>
    ape::write.FASTA(here(glue::glue("temp/{opt$directory}/{opt$metabarcode}.query.{opt$query}.fasta")))

# IF clause if blast db is already there
if(!file.exists(here(glue::glue("temp/{opt$directory}/{opt$metabarcode}.fasta")))) {
    # writeLines
    writeLines("\nMaking BLAST database ...\n")

    # convert reflib to fasta
    metabarcode.fas <- tab2fas(df=reflib.sub,seqcol="nucleotidesFrag",namecol="dbid")

    # write out
    metabarcode.fas |> ape::write.FASTA(file=here(glue::glue("temp/{opt$directory}/{opt$metabarcode}.fasta")))

    # make blast db
    makeblastdb.string <- glue::glue("makeblastdb -in temp/{opt$directory}/{opt$metabarcode}.fasta -dbtype nucl -blastdb_version 5")
    system(command=makeblastdb.string,ignore.stdout=FALSE)
}

# make a blast id string
blast.string <- glue::glue("blastn -task blastn -num_threads {opt$threads} -evalue 1 -word_size 7 -max_target_seqs 1000 -db temp/{opt$directory}/{opt$metabarcode}.fasta -outfmt '6 qseqid sseqid evalue length pident nident score bitscore' -out temp/{opt$directory}/{opt$metabarcode}.query.{opt$query}.fasta.out -query temp/{opt$directory}/{opt$metabarcode}.query.{opt$query}.fasta")
# execute
writeLines("\nQuerying BLAST database ...\n")
system(command=blast.string,ignore.stdout=FALSE)

# make cols
blast.cols <- c(
    "asv",
    "blastDbid",
    "blastEvalue",
    "blastLength",
    "blastPident",
    "blastNident",
    "blastScore",
    "blastBitscore"
)

# load results
blast.results <- read_tsv(here(glue::glue("temp/{opt$directory}/{opt$metabarcode}.query.{opt$query}.fasta.out")), col_names=blast.cols, show_col_types = FALSE) |> 
    rename(query=asv,dbid=blastDbid) |>
    mutate(query=as.character(query),dbid=as.character(dbid))

# annotate results
blast.results.annot <- blast.results |> left_join(
        reflib.sub |> select(dbid,sciNameValid) |> mutate(dbid=as.character(dbid))
    , by = join_by(dbid)) |>
    relocate(sciNameValid,.after=dbid) |>
    mutate(query=if_else(query==dbid,TRUE,FALSE)) |>
    arrange(desc(query),desc(blastBitscore),sciNameValid)

# write out full
blast.results.annot |> write_csv(here(glue::glue("temp/{opt$directory}/{opt$metabarcode}.query.{opt$query}.fasta.out.csv")))

 writeLines("\nPrinting BLAST result ...\n")

# print just target spp
target.spp <- blast.results.annot |> filter(query==TRUE) |> pull(sciNameValid)
blast.results.annot |> 
    filter(sciNameValid==target.spp) |>
    arrange(desc(blastBitscore)) |>
    print(n=Inf)
