[![DOI](https://zenodo.org/badge/327435617.svg)](https://zenodo.org/badge/latestdoi/327435617)

# Meta-Fish-Lib: a generalised, dynamic DNA reference library for metabarcoding of fishes
![SeaDNA Logo](assets/logo.svg)

This repository hosts a comprehensive multi-locus mitochondrial DNA reference library dataset for UK fish species, derived from the [NCBI GenBank](https://www.ncbi.nlm.nih.gov/nucleotide) and [Barcode of Life BOLD](http://www.boldsystems.org/index.php) databases. The dataset includes freshwater and marine species, and can be used in a variety of applications from DNA barcoding of human food products using full COI barcodes, to metabarcoding of gut or environmental samples using fragments of 12S. The library will be updated with each new GenBank release. Both common and rare UK fish species are included. A species coverage report for all primer sets can be found at [assets/reports-tables.md](assets/reports-tables.md). The UK reference library is ready-to-use, but the code can easily generate a new reference libary for a different region by providing a custom species list (see [FAQ](#FAQ)).

This reference library has several unique features that make it useful to the wider DNA barcoding and DNA metabarcoding communities:

* Flexible - the library is not limited to any particular metabarcode locus or primer set. I have included the most popular ones (Table 1), but new ones can be added as required.
* Exhaustive - seaching by single gene names can often miss critical results due to poorly annotated records, but using hidden Markov models it is simple to extract the homologous DNA fragments from large dumps of sequence data.
* Comprehensive - searching by species names can exclude potential hits because of changes in taxonomy, but here we search for all species synonyms, and then subsequently validate those names to provide a taxonomically up-to-date reference library. 
* Quality - sequences on GenBank are frequently annotated with incorrect species names, but we employ a 'spreadsheet of shame' where dubious quality sequences are automatically excluded, and phylogenetic quality control steps are used to screen each new version.
* Dynamic - it's easy to update to each new GenBank release (see code below).
* Quick - runs overnight, including quality control steps.
* Simple - the final reference library can be downloaded onto your computer with only three packages loaded and seven lines of R code (see code below).
* Customisable - by forking or cloning the repository custom modifications can be made, e.g. excluding particular species or making taxonomic changes, or using a completely different list of species.
* Self contained - to recreate the reference library, all code and R package versions are in this self contained project, meaning less risk of clashing or code breaking when packages update.
* Citable - DOIs are issued with each new release.

This README outlines the contents of the repository and a brief description of the workflow involved in creating/updating a metabarcoding reference library, as well instructions to simply access the current data immediately. If an error is apparent, raise a ticket in [Issues](https://github.com/genner-lab/meta-fish-lib/issues) or submit a pull request.

The work is part of the NERC funded [SeaDNA Project](https://twitter.com/SeaDNAproject), and should be cited using version appropriate DOIs that are found in [Releases](https://github.com/genner-lab/meta-fish-lib/releases).

### TL;DR (give me the data)

If you require simply the final reference library file for immediate use, it can be downloaded directly using the R code below, and converted into FASTA and CSV formats for any of the available primer sets in Table 1.

##### Retrieve latest reference library:

```r
# load packages (install if required)
library("tidyverse")
library("vroom")
library("ape")

# load remote references and scripts (requires internet connection)
source("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/scripts/references-load-remote.R")
source("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/scripts/references-clean.R")
source("https://raw.githubusercontent.com/legalLab/protocols-scripts/master/scripts/tab2fas.R")

# choose a metabarcode fragment (primer set) from the following:
print(c("coi.lerayxt","coi.ward","12s.miya","12s.riaz","12s.valentini","12s.taberlet","16s.berry","cytb.minamoto"))
# change 'frag' argument as appropriate:
reflib.sub <- subset_references(df=reflib.orig, frag="12s.miya")

# convert to fasta file
# uses the standard database id field ('dbid') as a label
# 'dbid' is the GenBank GI number, or the BOLD processID number
# custom labels can be created with 'mutate()' and 'paste()' using other fields and changing 'namecol' argument - see FAQ
reflib.fas <- tab2fas(df=reflib.sub, seqcol="nucleotides", namecol="dbid")

# write out fasta file and corresponding csv table
write.FASTA(reflib.fas, file="references.fasta")
write_csv(reflib.sub, file="references.csv")
```

Particular attention should be paid to cleaning steps in `scripts/references-clean.R`; sequences flagged as unreliable (using phylogenetic quality control) are listed in `assets/exclusions.csv` and excluded, while sequences flagged by NCBI as "unverified" are also removed. Taxonomic changes are also made, automatically via validating names against FishBase, and also custom changes (*Cottus perifretum* relabelled as *Cottus cottus*, *Atherina presbyter* relabelled as *Atherina boyeri*, and *Pungitius laevis* relabelled as *Pungitius pungitius*. Where are changes are made, both the original GenBank names and the validated FishBase names are provided.

**Table 1: Available primer sets**

Study | Official name | Nickname | Locus
----- | ----- | ----- | -----
[Miya et al. (2015)](http://dx.doi.org/10.1098/rsos.150088) | MiFish U/E | miya | 12S
[Taberlet et al. (2018)](http://dx.doi.org/10.1093/oso/9780198767220.001.0001) | Tele02 | taberlet | 12S
[Valentini et al. (2016)](http://dx.doi.org/10.1111/mec.13428) | L1848/H1913 | valentini | 12S
[Riaz et al. (2011)](http://dx.doi.org/10.1093/nar/gkr732) | 12S-V5 | riaz | 12S
[Wangensteen et al. (2018)](http://dx.doi.org/10.7717/peerj.4705) | Leray-XT | leray | COI
[Ward et al. (2005)](http://dx.doi.org/10.1098/rstb.2005.1716) | FishF1/R1 | ward | COI
[Berry et al. (2017)](http://dx.doi.org/10.1002/ece3.3123) | Fish16sF/D | berry | 16S
[Minamoto et al. (2012)](http://dx.doi.org/10.1007/s10201-011-0362-4) | L14912-CYB | minamoto | cytb

### Create/update the reference library manually

You don't need to run this code below if you just want a copy of the reference library (run code above). This code below is if you want to update it yourself or want to modify and make a new library. I will endeavour to keep this repository up-to-date with GenBank, but if hasn't been updated, email me. 

System requirements: R, git, hmmer, mafft and raxml need to be installed on your system. Unfortunately, these scripts are optimised for a Unix system, and I'm unable to offer any Windows support here ([Windows is now able to run Ubuntu Linux ](https://tutorials.ubuntu.com/tutorial/tutorial-ubuntu-on-windows#0)).

You will also require an API key from NCBI in order to access GenBank data at a decent rate. See info here for how to get a key: [ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/](https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/)

##### Bash terminal:

```bash
# admin - clone the repository and create temporary directories
git clone https://github.com/genner-lab/meta-fish-lib.git
cd meta-fish-lib
mkdir reports temp

# create NCBI API key (this is ignored by git)
# substitute the 'my-ncbi-key' part for your actual key obtained from NCBI
echo 'ncbi.key <- "my-ncbi-key"' > assets/ncbi-key.R

# install required R packages using renv (only need to run this once)
Rscript -e "renv::restore()"

# check the genbank versions remotely (github), locally (your machine), and on genbank itself
# you can update if the remote or local versions are behind genbank
scripts/check-genbank.R

# search GenBank - takes just over two hours
# argument one [assets/species-table.csv] is the list of species to search for
# argument two [4] is the number of processing cores to run in parallel
# more threads are faster, but more prone to errors by overloading the server with requests
# make sure not to request more cores than are present on your system
scripts/sequences-download.R assets/species-table.csv 4

# assemble the reference library with hidden Markov models and obtain metadata
# takes about 20 mins
# argument one [4] is the number of processing cores to run in parallel
# this script overwrites the local master reference library 'assets/reference-library-master.csv.gz'
scripts/references-assemble.R 4

# phylogenetic quality control (QC) - takes about six hours
# argument one [~/Software/standard-RAxML/raxmlHPC-AVX] is the path on your system to raxml
# argument two [8] is the number of processing cores to run in parallel
scripts/qc.R ~/Software/standard-RAxML/raxmlHPC-AVX 8

# now manually review the phylogenetic tree PDFs output into 'reports/qc_GBVERSION_MONTH-YEAR' 
# if found, add suspect accessions manually to 'assets/exclusions.csv'

# compile species coverage reports
make -f scripts/Makefile

# update GitHub repository (updates remote version)
cp reports/reports-tables.md assets/reports-tables.md
git add assets/reference-library-master.csv.gz assets/exclusions.csv assets/reports-tables.md
git commit -m "updated master to genbank version x"

# confirm changes are made
scripts/check-genbank.R
```

### FAQ

* How do I cite the reference library? - Zenodo DOIs for each version are in see [Releases](https://github.com/genner-lab/meta-fish-lib/releases). An important note: the reference library and code presented here supercedes a previous iteration hosted at [github.com/boopsboops/reference-libraries](https://github.com/boopsboops/reference-libraries). The new version here starts at v241, but I have archived the previous versions of the just reference library file (`assets/reference-library-master.csv.gz`) here. Therefore the old code used to generate the libraries prior to v241 are not archived together with the library here.
* Can I make a reference library for fishes of my country/region? - Yes, just change the list of species in `assets/species-table.csv`. First you will need a list of fish species from your region. A useful tools for this are the [rgbif](https://docs.ropensci.org/rgbif/index.html) package and [FishBase](https://www.fishbase.se/search.php).
* Can I make a reference library for a taxonomic group that isn't fishes? - At the moment I  use the [rfishbase](https://docs.ropensci.org/rfishbase/index.html) package to generate higher taxonomic ranks and validate scientific names because this is the best source of data for fishes. However, more general solutions could easily be employed using the [taxize](https://docs.ropensci.org/taxize/) package or [taxadb](https://docs.ropensci.org/taxadb/index.html) package, with minimal changes to the code. Fork away!
* How do you get the synonyms? - I used the `synonyms()` function in the [rfishbase](https://docs.ropensci.org/rfishbase/index.html) package, but the [taxize](https://docs.ropensci.org/taxize/) package or [taxadb](https://docs.ropensci.org/taxadb/index.html) package would achieve similar results.
* How do you generate the hidden Markov models? - First I downloaded the fish mitochondrial genomes and annotations from Prof. Masaki Miya's MitoFish website at [mitofish.aori.u-tokyo.ac.jp/](http://mitofish.aori.u-tokyo.ac.jp/), and extracted the genes of interest and aligned them with mafft. Then I searched for primer sequences and cut out the fragments of interest using [Geneious](https://www.geneious.com/prime/) and exported as fasta. Then I ran the hmmer function `hmmbuild` to create the hidden Markov models.
* What if I want more than fishes? - Indeed, for many metabarcoding applications you would want to identify 'off-target' reads, so a wider reference library is required as a supplement to the one presented here. I use the NCBI RefSeq mitochondrial DNA database ([ftp://ftp.ncbi.nlm.nih.gov/refseq/release/mitochondrion](ftp://ftp.ncbi.nlm.nih.gov/refseq/release/mitochondrion)), which should have a sufficiently broad coverage to roughly classify eukaryote mtDNA.
* Why is the code for these tasks not in the repository? - unfortunately most of the code to perform these steps in not really general enough to be useful, as it requires a fair amount of manual steps and checking. Please contact me if you need specific help with these.
* Is the reference library guaranteed error free? - LOL, no! The phylogenetic quality control step is tedious and subjective. Here, phylogenetic QC trees for each primer set need to be manually checked. To help with this tips are coloured by monophyly and haplotype sharing to visually assist identifying dubious accessions. This is a much easier task for loci where taxa are well differentiated and large numbers of sequences exist (such as for COI). It is not easy for ribosomal fragments with fewer informative nucleotides and fewer sequences. The choice of which accessions to blacklist in `assets/exclusions.csv` has been entirely at my discretion. I hope I have caught the majority of the most egregious examples, however. As a rule of thumb, an accession is blacklisted if: (a) individual(s) of species x are identical to or nested within a cluster of sequences of species y, but with other individuals of species x forming an independent cluster; and (b) the putatively spurious sequences coming from a single study, while the putatively correct sequences of species x and y coming from multiple studies. It is important to note that this is far from foolproof, and many species will naturally be non-monophyletic and/or share haplotypes with other species (e.g. sprats and herrrings). I tried to be conservative, and not remove too many sequences if there was doubt, and especially so for taxa that I am not familar with. Mistakes certainly remain, so I recommend running the QC step to check yourself (or email me for the trees). Blast is also useful for checking for matches against species not in the reference library. 
* Why not use [sativa](https://github.com/amkozlov/sativa) for automated quality control? - Good question.  Software such as [sativa](https://github.com/amkozlov/sativa) is available to automate the process, and while I may investigate this option in the future, for the meantime I think it is always a good idea to eyeball and become familiar with your data and develop an informed judgement.
* Why are the sequence labels in the `references.fasta` file just numbers? - when you download the reference library as shown above, the `references.fasta` file will use the 'dbid' column which is the database identification numbers. For NCBI these are 'GI' numbers (GenInfo Identifiers); these are equivalent to NCBI accession numbers, and will resolve accordingly on NCBI services; for BOLD, these are the 'processid' numbers. As there are many possible formats required for various taxonomy assignment software, I am unable to know which ones you will require, and have therefore chosen a sensible default. To make your own custom labels, just use the dplyr `mutate()` and `paste()` functions to join columns in the table to make a new label column. Below I make a label of format 'dbid_family_genus_species'. Table 2 explains the fields in the reference library table. 

```r
reflib.label <- reflib.sub %>% 
    mutate(label=paste(dbid,family,str_replace_all(sciNameValid," ","_"),sep="_"))
reflib.fas <- tab2fas(df=reflib.label,seqcol="nucleotides", namecol="label")
```

**Table 2: Key to reference library table fields**

Field (column name) | Description
----- | -----
source | source of record (GenBank or BOLD)
dbid | GenBank or BOLD database ID (GI, processid)
gbAccession | GenBank accession
sciNameValid | FishBase validated scientific name 
subphylum | taxonomic subphylum
class | FishBase taxonomic class
order | FishBase taxonomic order
family | FishBase taxonomic family
genus | FishBase taxonomic genus
sciNameOrig | original scientific name from GenBank/BOLD
fbSpecCode | FishBase species code
country | sample voucher collection country
catalogNumber | sample voucher catalogue number
institutionCode | sample voucher institution code
decimalLatitude | sample voucher collection latitude (decimal degrees)
decimalLongitude | sample voucher collection longitude (decimal degrees)
publishedAs | publication title
publishedIn | publication journal
publishedBy | publication lead author
date | date of sequence publication
notesGenBank | title of GenBank record
genbankVersion | version of GenBank used to generate this reference library
searchDate | date of reference library search
length | number of nucleotides in full record
nucleotides | nucleotides for full record
nucleotidesFrag.GENE.FRAGMENT.noprimers | nucleotides for gene fragment primer subset
lengthFrag.GENE.FRAGMENT.noprimers | number nucleotides in gene fragment primer subset


### Contents (A-Z)

* **`assets/`** - Required file and reference library.
    -**`hmms/`** - Hidden Markov models (HMMs) of gene markers of interest.
    - `exclusions.csv` - unreliable accessions to be excluded 
    - `logo.svg` - project logo
    - `reference-library-master.csv.gz` - master copy of the reference library
    - `reports-tables.md` - species coverage reports 
    - `species-table.csv` - list of species to search for
* **`renv/`** - Settings for the R environment.
* **`reports/`** - Location of QC reports. Temporary directory that is not committed to the repository, but needs to be created locally to run the scripts. Ignored by git.
* **`scripts/`** - R and shell scripts.
    - `check-genbank.R` - script to get genbank versions
    - `load-libs.R` - script to load all required packages and functions
    - `Makefile` - makefile to generate the species coverage reports
    - `qc.R` - quality control a reference library
    - `references-assemble.R` - extract and annotate reference libraries from ncbi/bold dumps 
    - `references-clean.R` - quality filter reference library
    - `references-load-local.R` - load reference library locally
    - `references-load-remote.R` - load reference library remotely
    - `reports-tables.Rmd` - knitr file to prepare species coverage reports
    - `sequences-download.R` - pulls all mitochondrial DNA from NCBI and BOLD for a list of species
* **`species/`** - Tables of species lists and tissue samples.
* **`temp/`** - Temporary file directory that is not committed to the repository, but needs to be created locally to run the scripts. Ignored by git.
