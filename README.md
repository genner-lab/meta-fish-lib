# Meta-Fish-Lib: A generalised, dynamic DNA reference library for metabarcoding of fishes
![SeaDNA Logo](assets/logo.svg)

This repository hosts a comprehensive mitochondrial DNA reference library dataset for UK fish species, derived from the NCBI GenBank and Barcode of Life BOLD databases. The dataset includes freshwater and marine species, and can be used in a variety of applications from DNA barcoding of human food products using full COI barcodes, to metabarcoding of gut or environmental samples using fragments of 12S. The library will be updated with each new GenBank release. 

This reference library and code repository supercedes the one at [github.com/boopsboops/reference-libraries](https://github.com/boopsboops/reference-libraries).

This README outlines the contents of the repository and a brief description of the workflow involved in creating/updating a metabarcoding reference library, as well instructions to simply access the current data immediately. Cloning or forking the repository will allow custom modifications to be made. If an error is apparent, raise a ticket in [Issues](https://github.com/genner-lab/meta-fish-lib/issues) or submit a pull request.

A species coverage report for all primer sets can be found at [assets/reports-tables.md](assets/reports-tables.md).

The work is part of the NERC funded [SeaDNA Project](https://twitter.com/SeaDNAproject), and should be cited using the following DOI: [10.6084/m9.figshare.7464521.v5](https://doi.org/10.6084/m9.figshare.7464521.v5).

### TL;DR (give me the data)

If you require simply the final reference database, it can be downloaded directly using the code below, and converted into FASTA and CSV formats for any of the available primer sets in Table 1. Additional mitochondrial primer sets can be added.

Particular attention should be paid to cleaning steps; sequences flagged as unreliable (using phylogenetic quality control) are listed in `assets/exclusions.csv` and excluded, while sequences flagged by NCBI as "unverified" are also removed. Taxonomic changes are also made, with for example, *Cottus perifretum* relabelled as *Cottus cottus*, *Atherina presbyter* relabelled as *Atherina boyeri*, and *Pungitius laevis* relabelled as *Pungitius pungitius* (both the original GenBank names and the validated FishBase names are provided).


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


[https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/](https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/)

```bash
#Admin
git clone https://github.com/genner-lab/meta-fish-lib.git
cd meta-fish-lib
mkdir reports temp

# Create NCBI API key
echo 'ncbi.key <- "my-ncbi-key"' > assets/ncbi-key.R

# Search GenBank
scripts/sequences-download.R assets/species-table.csv 4

# Assemble
scripts/references-assemble.R 4

# QC
scripts/qc.R ~/Software/standard-RAxML/raxmlHPC-AVX 8

# Compile reports
make -f scripts/Makefile

# Copy 
cp reports/reports-tables.md assets/reports-tables.md

#Commit 
#Add assets/reports-tables.md and assets/reference-library-master.csv.gz to GitHub repo.
git add assets/reports-tables.md assets/reference-library-master.csv.gz
git commit -m "updated master"
```