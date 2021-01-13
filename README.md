# Meta-Fish-Lib: A generalised, dynamic DNA reference library for metabarcoding of fishes
![SeaDNA Logo](assets/logo.svg)

This repository hosts a comprehensive mitochondrial DNA reference library dataset for UK fish species, derived from the NCBI GenBank and Barcode of Life BOLD databases. The dataset includes freshwater and marine species, and can be used in a variety of applications from DNA barcoding of human food products using full COI barcodes, to metabarcoding of gut or environmental samples using fragments of 12S. The library will be updated with each new GenBank release. 

The reference library and code presented here supercedes the previous one hosted at [github.com/boopsboops/reference-libraries](https://github.com/boopsboops/reference-libraries).

Both common and rare UK fish species are included. A species coverage report for all primer sets can be found at [assets/reports-tables.md](assets/reports-tables.md).

This reference library has several unique features that make it useful to the wider DNA barcoding and DNA metabarcoding communities:

* Flexible - the library is not limited to any particular metabarcode locus or primer set. I have included the most popular ones (Table 1), but new ones can be added as required.
* Exhaustive - seaching by gene name can often miss critical results due to poorly annotated records, but using hidden Markov models it is simple to extract the homologous DNA fragments from large dumps of sequence data
* Comprehensive - searching by species names can often miss critical results because of changes in taxonomy, but by searching for all available species synonyms, and then subsequently validating names can improve 
* Quality - GenBank data are often infamously mislabelled, but we employ here a 'spreadsheet of shame' where suspect sequences are automatically excluded, and phylogenetic quality control steps are used to screen new versions. 
* Dynamic - quick and easy to update with each new GenBank release.
* Simple - with only three packages loaded and seven lines of R code the reference library can be downloaded onto your computer.
* Customisable - by forking or cloning the repository custom modifications can be made.
* Self contained - to recreate the reference library, all code and R package versions are in a self contained project, meaning less risk of clashing or broken packages.
* Citable - DOIs are issued with each new release.

This README outlines the contents of the repository and a brief description of the workflow involved in creating/updating a metabarcoding reference library, as well instructions to simply access the current data immediately. If an error is apparent, raise a ticket in [Issues](https://github.com/genner-lab/meta-fish-lib/issues) or submit a pull request.

This work is part of the NERC funded [SeaDNA Project](https://twitter.com/SeaDNAproject), and should be cited using version appropriate DOIs that are found in [Releases](https://github.com/genner-lab/meta-fish-lib/releases).

### TL;DR (give me the data)

If you require simply the final reference database, it can be downloaded directly using the code below, and converted into FASTA and CSV formats for any of the available primer sets in Table 1. Additional mitochondrial primer sets can be added.

##### Retrieve latest reference library (in R)
```r
# load packages (install if required)
# ignore any conflict messages
library("vroom")
library("tidyverse")
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
# custom labels can be created with 'mutate()' using other fields and changing 'namecol' argument
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

### Create/update reference library manually

Prerequisites: the programs git, hmmer, mafft and raxml need to be installed on your system. Unfortunately, these scripts are optimised for a Unix system, and I'm unable to offer any Windows support here ([Windows is now able to run Ubuntu Linux ](https://tutorials.ubuntu.com/tutorial/tutorial-ubuntu-on-windows#0)).

You will also require an API key from NCBI in order to access GenBank data at a decent rate. See info here for how to get a key: [ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/](https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/)

##### Run in a bash terminal
```bash
# admin - clone the repository and create temporary directories
git clone https://github.com/genner-lab/meta-fish-lib.git
cd meta-fish-lib
mkdir reports temp

# create NCBI API key (this is ignored by git)
# substitute the 'my-ncbi-key' part for your actual key obtained from NCBI
echo 'ncbi.key <- "my-ncbi-key"' > assets/ncbi-key.R

# search GenBank - takes just over two hours
# argument one [assets/species-table.csv] is the list of species to search for
# argument two [4] is the number of processing cores to run in parallel
# more threads are faster, but more prone to errors by overloading the server with requests
# make sure not to request more cores than are present on your system
scripts/sequences-download.R assets/species-table.csv 4

# assemble the reference library with hidden Markov models and obtain metadata
# takes about 20 mins
# argument one [4] is the number of processing cores to run in parallel
scripts/references-assemble.R 4

# phylogenetic quality control (QC) - takes about six hours
# argument one [~/Software/standard-RAxML/raxmlHPC-AVX] is the path on your system to raxml
# argument two [8] is the number of processing cores to run in parallel
scripts/qc.R ~/Software/standard-RAxML/raxmlHPC-AVX 8

# now review phylogenetic tree PDFs output into 'reports/qc_GBVERSION_MONTH-YEAR' 
# if found, add suspect accessions manually to 'assets/exclusions.csv'

# compile species coverage reports
make -f scripts/Makefile

# update GitHub repository
cp reports/reports-tables.md assets/reports-tables.md
git add assets/reference-library-master.csv.gz assets/exclusions.csv assets/reports-tables.md
git commit -m "updated master to genbank version x"
```

### Advanced

Building this reference library. 

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
