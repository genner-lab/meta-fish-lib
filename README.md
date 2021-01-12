# Meta-Fish-Lib: A generalised, dynamic DNA reference library for metabarcoding of fishes
![SeaDNA Logo](assets/logo.svg)

This repository hosts a comprehensive mitochondrial DNA reference library dataset for UK fish species, derived from the NCBI GenBank and Barcode of Life BOLD databases. The dataset includes freshwater and marine species, and can be used in a variety of applications from DNA barcoding of human food products using full COI barcodes, to metabarcoding of gut or environmental samples using fragments of 12S. The library will be updated with each new GenBank release. 

This reference library and code repository supercedes the one at [github.com/boopsboops/reference-libraries](https://github.com/boopsboops/reference-libraries).

This README outlines the contents of the repository and a brief description of the workflow involved in creating/updating a metabarcoding reference library, as well instructions to simply access the current data immediately. Cloning or forking the repository will allow custom modifications to be made. If an error is apparent, raise a ticket in [Issues](https://github.com/genner-lab/meta-fish-lib/issues) or submit a pull request.

A species coverage report for can be found at [assets/reports-tables.md](assets/reports-tables.md).

The work is part of the NERC funded [SeaDNA Project](https://twitter.com/SeaDNAproject), and should be cited using the following DOI: [10.6084/m9.figshare.7464521.v5](https://doi.org/10.6084/m9.figshare.7464521.v5).

### TL;DR (give me the data)

If you just want the to use the final reference database (last updated 2020-08-31 on GenBank v239), it can be downloaded at [github.com/boopsboops/reference-libraries/raw/master/references/uk-fish-references.csv.gz](https://github.com/boopsboops/reference-libraries/raw/master/references/uk-fish-references.csv.gz). The file is 8 MB compressed (gzip), but is 116 MB uncompressed. The readr package function `read_csv()` will automatically decompress a gz file, but if the file needs to be unpacked to disk, the WinRAR or 7-Zip software on Windows can be used. The final dataset is in tabular CSV format; follow the Gist at [gist.github.com/boopsboops/a1c790064fe0a14af5226d098645ca60](https://gist.github.com/boopsboops/a1c790064fe0a14af5226d098645ca60) to extract the region you want, and then convert to fasta format if required. The currently available regions are as follows below in Table 1. Any additional mitochondrial primer set can be trivially added.

The dataset offered above is raw, but is cleaned when the `scripts/references-load.R` script is run. Particular attention should be paid to how this operates; sequences flagged as unreliable (using phylogenetic quality control) are listed in `references/exclusions.csv` and excluded, while sequences flagged by NCBI as "unverified" are also removed. Taxonomic changes are also made, with for example, *Cottus perifretum* relabelled as *Cottus cottus*, *Atherina presbyter* relabelled as *Atherina boyeri*, and *Pungitius laevis* relabelled as *Pungitius pungitius*. Both the original GenBank names and the validated FishBase names are provided.







Admin
`mkdir reports temp`

Search GenBank
`scripts/sequences-download.R assets/species-table.csv 4`

Assemble
`scripts/references-assemble.R 4`

QC
`scripts/qc.R ~/Software/standard-RAxML/raxmlHPC-AVX 8`

Compile reports
`make -f scripts/Makefile`

Copy 
`cp reports/reports-tables.md assets/reports-tables.md`

Commit 
Add `assets/reports-tables.md` and `assets/reference-library-master.csv.gz` to GitHub repo.
`git add assets/reports-tables.md assets/reference-library-master.csv.gz`
`git commit -m "updated master`
