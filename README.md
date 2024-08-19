[![DOI](https://zenodo.org/badge/327435617.svg)](https://zenodo.org/badge/latestdoi/327435617)

# Meta-Fish-Lib: A generalised, dynamic DNA reference library for metabarcoding of fishes

Collins, R.A., Trauzzi, G., Maltby, K.M., Gibson, T.I., Ratcliffe, F.C., Hallam, J., Rainbird, S., Maclaine, J., Henderson, P.A., Sims, D.W., Mariani, S. & Genner, M.J. (2021). Meta-Fish-Lib: A generalised, dynamic DNA reference library pipeline for metabarcoding of fishes. _Journal of Fish Biology_. [https://doi.org/10.1111/jfb.14852](https://doi.org/10.1111/jfb.14852).

![SeaDNA Logo](assets/logo.svg)

This repository hosts a comprehensive multi-locus mitochondrial DNA reference library dataset for fish species of the United Kingdom (UK), derived from the [NCBI GenBank](https://www.ncbi.nlm.nih.gov/nucleotide) and [Barcode of Life BOLD](http://www.boldsystems.org/index.php) databases. The dataset includes both freshwater and marine species, and can be employed in a variety of applications. e.g. DNA barcoding of human food products using full COI barcodes, to metabarcoding of gut or environmental samples using fragments of 12S. The library will be updated with each new GenBank release. Both common and rare UK fish species are included. A species coverage report for all primer sets can be found at [assets/reports-tables.md](assets/reports-tables.md). This UK reference library is curated and ready-to-use, but the code provided here can easily generate a new reference library for a different location (see [FAQ](#FAQ)).

In addition to providing quality controlled and curated fish references, this reference library has several unique features that make it useful to the wider DNA barcoding and DNA metabarcoding communities:

* Flexible - the library is not limited to any particular metabarcode locus or primer set. I have included the most popular ones (Table 1), but new ones can be added as required.
* Comprehensive - seaching by single gene names can often miss critical results due to poorly annotated records, but using hidden Markov models it is simple to extract homologous DNA fragments from large dumps of sequence data.
* Exhaustive - searching by species names can exclude potential hits because of changes in taxonomy, but here we search for all species synonyms, and then subsequently validate those names to provide a taxonomically up-to-date reference library. 
* Reliable - sequence data on GenBank are frequently misannotated with incorrect species names, but we have created a list of dubious quality accessions that are automatically excluded when the reference library is loaded each time. We use phylogenetic quality control methods to assist in screening each new GenBank version and update this list accordingly.
* Dynamic - it's easy to update to each new GenBank release (see code [below](#bash-terminal)), and the versioning of this repository reflects the GenBank release on which it was made.
* Quick - the final reference library can be downloaded onto your computer in just a few seconds with only two packages loaded and eight lines of R code ([below](#retrieve-latest-reference-library)). Generating this reference library from scratch ([below](#bash-terminal)) takes a couple of hours, with the phylogenetic quality control steps completing overnight.
* Customisable - by forking or cloning the repository, custom modifications can be made, e.g. excluding particular species, making taxonomic changes, or using a completely different list of species.
* Self contained - to recreate the reference libraries, all code and R package versions are found within in this self contained project, courtesy of [renv](https://rstudio.github.io/renv/articles/renv.html). This means less risk of clashing installations or broken code when packages and R versions upgrade.
* Citable - DOIs are issued with each new GenBank release.

This README outlines the contents of the repository and a brief description of the workflow involved in creating/updating a metabarcoding reference library, as well instructions to simply access the current data immediately. If an error is apparent, raise a ticket in [Issues](https://github.com/genner-lab/meta-fish-lib/issues) or submit a pull request.

The work is part of the NERC funded [SeaDNA Project](https://twitter.com/SeaDNAproject), and should be cited using version appropriate DOIs that are found in [Releases](https://github.com/genner-lab/meta-fish-lib/releases), or the Collins et al. (2021) _Journal of Fish Biology_ article ([https://doi.org/10.1111/jfb.14852](https://doi.org/10.1111/jfb.14852)) describing the software.

### TL;DR (give me the data)

If you require simply the UK reference library for immediate use, it can be downloaded directly using the R code below, and converted into FASTA and CSV formats for any of the available primer sets in Table 1. I will endeavour to keep up-to-date with GenBank, but if hasn't been updated, email me.

##### Retrieve latest reference library:

```r
### START A FRESH R SESSION ###

# load packages (install if required)
library("tidyverse")
library("ape")

# load REMOTE references and cleaning scripts (requires internet connection)
source("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/scripts/references-load-remote.R")
source("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/scripts/references-clean.R")

# subset reference library table by metabarcode fragment (primer set) from the following options:
print(tibble(metabarcodes=c("coi.lerayxt","coi.ward","12s.miya","12s.riaz","12s.valentini","12s.taberlet","16s.berry","cytb.minamoto")))
# change 'metabarcode' argument as appropriate:
reflib.sub <- subset_references(df=reflib.cleaned, metabarcode="12s.miya")

# [OPTIONAL] taxonomically dereplicate and filter on sequence length
# 'proplen=0.5' removes sequences shorter than 50% of median sequence length
# 'proplen=0' retains all sequences
reflib.sub <- derep_filter(df=reflib.sub, derep=TRUE, proplen=0.5)

# write out reference library in various formats to current working directory
# currently supported formats are: [1] sintax, [2] dada2 (taxonomy), [3] dada2 (species), [4] Qiime2 (fasta and taxonomy), and [5] plain dbid (GenBank or BOLD database identifiers)
write_references_fasta(df=reflib.sub)
```

Particular attention should be paid to cleaning steps in `scripts/references-clean.R`. Sequences flagged as unreliable (using phylogenetic quality control) are listed in `assets/exclusions.csv` and automatically excluded, while sequences flagged by NCBI as "unverified" are also removed. Taxonomic changes are also made, automatically via validating names against FishBase, and also a custom taxonomic changes file `assets/taxonomy-changes.csv`. Here, *Cottus perifretum* is relabelled as *Cottus gobio*, *Atherina presbyter* relabelled as *Atherina boyeri*, and *Pungitius laevis* relabelled as *Pungitius pungitius*. Where are changes are made, both the original GenBank names and the validated FishBase names are provided (see Table 2). It is IMPORTANT to run this cleaning step before the reference library is used.

**Table 1: Available primer sets**

Study | Official name | Nickname | Locus
----- | ----- | ----- | -----
[Miya et al. (2015)](https://doi.org/10.1098/rsos.150088) | MiFish U/E | 12s.miya | 12S
[Taberlet et al. (2018)](https://doi.org/10.1093/oso/9780198767220.001.0001) | Tele02 | 12s.taberlet | 12S
[Taberlet et al. (2018)](https://doi.org/10.1093/oso/9780198767220.001.0001) | Elas02 | 12s.miya | 12S
[Valentini et al. (2016)](https://doi.org/10.1111/mec.13428) | L1848/H1913 | 12s.valentini | 12S
[Riaz et al. (2011)](https://doi.org/10.1093/nar/gkr732) | 12S-V5 | 12s.riaz | 12S
[Leray et al. (2013)](https://doi.org/10.1186/1742-9994-10-34) | mlCOIintF/jgHCO2198 | coi.lerayxt | COI
[Ward et al. (2005)](https://doi.org/10.1098/rstb.2005.1716) | FishF1/R1 | coi.ward | COI
[Berry et al. (2017)](https://doi.org/10.1002/ece3.3123) | Fish16sF/D | 16s.berry | 16S
[Kitano et al. (2007)](https://doi.org/10.1007/s00414-006-0113-y) | 	L2513/H2714 | 16s.kitano | 16S
[Minamoto et al. (2012)](https://doi.org/10.1007/s10201-011-0362-4) | L14912-CYB | cytb.minamoto | cytb

### Create/update the reference library manually

You don't need to run this code below if you just want a copy of the UK reference library (run code above). This code below is if you want to update it yourself or want to modify and make a new library.

System requirements: [R](https://cran.r-project.org/), [git](https://git-scm.com/), [hmmer](http://hmmer.org/), [mafft](https://mafft.cbrc.jp/alignment/software/) and [raxml-ng](https://github.com/amkozlov/raxml-ng) need to be installed on your system, and available on your [$PATH](https://www.howtogeek.com/658904/how-to-add-a-directory-to-your-path-in-linux/). With the exception of raxml-ng, the programs can be installed from Ubuntu repositories using `sudo apt install` (see also [Homebrew](https://brew.sh/) `brew install` for MacOS). In case of difficulties, check the developer's website and update to newer versions if required. Unfortunately, these scripts are optimised for a Unix system, and I'm unable to offer any Windows support here ([Windows is now able to run Ubuntu Linux ](https://tutorials.ubuntu.com/tutorial/tutorial-ubuntu-on-windows#0)).

You will also require an API key from NCBI in order to access GenBank data at a decent rate. See info here for how to get a key: [ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/](https://ncbiinsights.ncbi.nlm.nih.gov/2017/11/02/new-api-keys-for-the-e-utilities/)

##### Bash terminal:

```bash
### admin - clone the repository and create temporary directories ###
git clone --depth 1 https://github.com/genner-lab/meta-fish-lib.git meta-fish-lib
cd meta-fish-lib
mkdir -p reports temp/fasta-temp

### create NCBI API key (this is ignored by git) ###
# substitute the "<YOUR-NCBI-KEY>" part for your actual key obtained from NCBI
echo 'ncbi.key <- "<YOUR-NCBI-KEY>"' > assets/ncbi-key.R
echo 'ENTREZ_KEY=<YOUR-NCBI-KEY>' > .Renviron

### install required R packages using renv (only need to run this once) ###
Rscript -e "renv::restore()"

### check the genbank versions remotely (github), locally (your machine), and on genbank itself ###
# you can update if the remote or local versions are behind genbank
scripts/check-genbank.R

### OPTION [1] replace the species table with your custom list ###
# change to file location on your machine
# this will overwrite the current table at 'assets/species-table.csv'
cp ~/path/to/my-species-table.csv assets/species-table.csv

### OPTION [2] use FishBase to generate a species list for a chosen country
# this will overwrite the current table at 'assets/species-table.csv'
# argument "-c" [826] is the ISO country code for your chosen country
#     ISO country codes can be found at https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes
# argument "-s" [true] are species synonyms
#     a value of "true" provides all accepted names and junior synonyms, a value of "false" provides only the accepted names
scripts/get-species.R -c 826 -s true

### search GenBank ###
# argument "-q" [500] is the max search batch query length (in characters)
#     the maximum search query length technically allowed by NCBI is 2500
#     bigger queries will be faster, but can be more prone to server errors
#     conversely, many small queries can also result in server errors by increasing the individual chances that one will fail
# argument "-t" [4] is the number of processing threads to run in parallel
#     more threads are faster, but more prone to errors by overloading the server with requests
#     most laptops and desktops are hyperthreaded with two virtual CPUs (threads) for each physical CPU (cores)
#     run "lscpu | grep -E '^Thread|^Core|^Socket|^CPU\('" to obtain info on available cores/threads
#     make sure not to request more threads than are present on your system
# argument "-e" [false] is to run an exhaustive ("true") or simple search ("false")
#     the simple search just uses the terms "mitochondrion,mitochondrial"  
#     the exhaustive search in addition uses "COI,CO1,cox1,cytb,cytochrome,subunit,COB,CYB,12S,16S,rRNA,ribosomal"
#     the simple search will pick up 99% of mtDNA sequences, but may miss older sequences that were not well annotated
#     the simple search is faster, less prone to error, and may help if you need to search for a lot of species 
scripts/sequences-download.R -q 500 -t 4 -e false

### assemble the reference library with hidden Markov models and obtain metadata ###
# argument "-t" [4] is the number of processing threads to run in parallel
#     do not request more threads than metabarcode markers
#     do not request more threads than are present on your system
# argument "-m" [all] is the metabarcode marker, here choosing "all" eight available metabarcodes
#     if you don't require all metabarcodes, it's strongly recommended to specify only the one(s) you want
#     to choose a specific metabarcode marker(s), use the codes in Table 1 and separate with a comma and no space
#     e.g. "-m 12s.miya,coi.ward"
# note this script overwrites the local master reference library 'assets/reference-library-master.csv.gz'
scripts/references-assemble.R -t 4 -m all

### phylogenetic quality control (QC) ###
# argument "-t" [4] is the number of processing threads to run in parallel
#    note that the threads argument doesn't influence the performance operation of raxml-ng or mafft
#    these applications automatically determine the optimum number of threads for your system
#    the argument only applies to preparing/plotting
#    do not request more threads than metabarcode markers
#    do not request more threads than are present on your system
# argument "-v" [false] is verbosity (information printed to screen) from the alignment and phylogenetic steps
#    a value of "true" prints program info, a value of "false" prevents printing of info
#    seeing the output on screen is useful if you run into problems and need to debug, otherwise it's not required
scripts/qc.R -t 4 -v false

# now manually review the phylogenetic tree PDFs output into 'reports/qc_GBVERSION_MONTH-YEAR' 
# if found, add suspect accessions manually to 'assets/exclusions.csv'

### compile species coverage reports ###
make -f scripts/Makefile

### update GitHub repository (updates remote version - only works if you have forked the repository rather than cloned) ###
# change x to actual version
cp reports/reports-tables.md assets/reports-tables.md
git add assets/reference-library-master.csv.gz assets/exclusions.csv assets/reports-tables.md
git commit -m "updated master to genbank version x"
git push
git tag -a vX -m "GenBank vX"
git push --tags
# now make a release using this tag on GitHub
# if Zenodo has been set up correctly, a DOI should become available immediately

### confirm changes are made ###
scripts/check-genbank.R

### if all worked, you can clean up to save disk space ###
# be sure that you want to do this!
rm -r temp

### your master reference library is now located at 'assets/reference-library-master.csv.gz' ###
# IMPORTANT: this reference library contains the unfiltered records, and needs to be cleaned before use

### clean, dereplicate, length filter, and write out the reference library for use ###
# argument "-m" [12s.miya] is the metabarcode marker
#    choose one of the eight available metabarcodes in Table 1.
# argument "-d" [true] is the taxonomic dereplication flag
#    a value of "true" removes all duplicate sequences within each species, but sequences can be identical between species
#    subsequences, i.e. shorter sequences that differ only by nucleotides missing at ends, are considered duplicate haplotypes
#    a value of "false" keeps all sequences
# argument "-p" [0.5] is the sequence-length filtering flag
#    for example, a value of 0.5 removes all sequences shorter than 50% of the median sequence length 
#    can be any value between 0 and 1
#    a value of 0 retains all sequences
scripts/clean-derep-write.R -m 12s.miya -d true -p 0.5
```

### FAQ

* **It doesn't work!** - There are several things that can go wrong with the installation and running of meta-fish-lib, which may prevent the software working as intended. These include, but are not limited to:
  + Wrong R version used. The R version that the software was tested on is provided in the `.R-version` file. Some package versions may not compile on different R versions. I recommend using the [renv-installer](https://github.com/jcrodriguez1989/renv-installer) software to manage your R versions across different projects. This software is separate to the [renv](https://rstudio.github.io/renv/index.html) R package manager that is also used here.
  + Dependent software not installed. The required software is: [R](https://cran.r-project.org/), [git](https://git-scm.com/), [hmmer](http://hmmer.org/), [mafft](https://mafft.cbrc.jp/alignment/software/) and [raxml-ng](https://github.com/amkozlov/raxml-ng). They are easily installed via `sudo apt install` (Ubuntu) or `brew install` (MacOS). Git is only required if you want to clone the repository or host your own fork of the repository; raxml-ng is only required for the QC step, so you can make the reference library without it if it's not needed. Except in the case of R (see above), these are all stable pieces of software, so I don't think the versions make much difference. Please raise an issue if you suspect a problem.
  + An NCBI key was not provided. Please see above instructions for how to do this.
  + The code throws an error. There are three seperate scripts that access the NCBI servers, for querying, downloading, and annotating the sequences. If just one batch call fails in a script, then the whole pipeline will fail. This is the cause of most errors. I have tried to make the code as robust as possible, but it still often fails for various reasons. The bigger the list of species to search for, the more likely it is to fail. Please be patient. Below in the FAQ are some tips for avoiding this problem.
  + The pipeline wasn't tested. Please, before you start using the software with your own data, ensure that everything is running without problems using the test data provided. This ensures first that the software is working as intended under the conditions I have tested it under. Here is some quick code to run the test data (only takes a few mins to run):

```bash
git clone --depth 1 https://github.com/genner-lab/meta-fish-lib.git meta-fish-lib-testing
cd meta-fish-lib-testing
mkdir -p reports temp/fasta-temp
echo 'ncbi.key <- "<YOUR-NCBI-KEY>"' > assets/ncbi-key.R
echo 'ENTREZ_KEY=<YOUR-NCBI-KEY>' > .Renviron
Rscript -e "renv::restore()"
cp assets/species-table-testing.csv assets/species-table.csv
scripts/check-genbank.R
scripts/sequences-download.R -q 1000 -t 2 -e false
scripts/references-assemble.R -t 2 -m all
scripts/qc.R -t 2 -v false
make -f scripts/Makefile
scripts/clean-derep-write.R -m 12s.miya -d true -p 0.5
```

* **How do I actually use the reference library?** - The reference library generated is provided in a tabular CSV format. This is because this type of data can be easily manipulated in R using popular packages such as [dplyr](https://dplyr.tidyverse.org/reference/dplyr-package.html). Most taxonomy assignment software, however, requires DNA sequence data in a format such as FASTA, and therefore the table requires converting before being used. I have provided a script `scripts/clean-derep-write.R` that loads up the local copy of the reference library and cleans, dereplicates, and length-filters it, before writing out as as FASTA. In the FASTA file the headers (lines commencing ">") contain the taxonomic assignment information, but unfortunately each of the many software implementations available tend to use its own syntax for these headers, and as such I am unable to know which ones you will be using. However, I have chosen some commonly used formats (e.g. sintax, dada2, plain dbid) for the default FASTA outputs. Please raise a ticket in [Issues](https://github.com/genner-lab/meta-fish-lib/issues) if you think an important one needs to be added. To make your own custom labels yourself, just use the dplyr `mutate()` and `paste()` functions to join columns in the table to make a new label column. Below I make a label of format 'dbid_family_genus_species' and write it out as a FASTA file. Table 2 explains the fields in the reference library table.

```r
library("tidyverse")
library("ape")
source("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/scripts/references-load-remote.R")
source("https://raw.githubusercontent.com/genner-lab/meta-fish-lib/main/scripts/references-clean.R")
reflib.sub <- subset_references(df=reflib.cleaned, metabarcode="12s.miya")
# make new label #
reflib.label <- reflib.sub %>% dplyr::mutate(label=paste(dbid,family,stringr::str_replace_all(sciNameValid," ","_"),sep="_"))
reflib.fas <- tab2fas(df=reflib.label,seqcol="nucleotides", namecol="label")
ape::write.FASTA(reflib.fas,file="reflib.fasta")
```

* **Can I make a reference library for fishes of my country/region?** - Yes, very easily. Just change the list of species in `assets/species-table.csv`. You can provide this list yourself, but make sure the format of the table is the same. If not interested in synonyms, you use the same species name for 'speciesName' and 'validName' and set 'status' set to "accepted name". The 'commonSpecies' field can be all set to TRUE if that is not of interest either, and the other information can be obtained from FishBase ('fbSpecCode' is the FishBase species code). Alternatively, run `scripts/get-species.R` to generate an annotated species/synonyms list for a given country using the [rfishbase](https://docs.ropensci.org/rfishbase/index.html) package (see option 2 in the example above).
* **What if I don't know which species I need?** - This is a common problem in diverse tropical regions where there is often poorly resolved taxonomy and lots of undescribed species. Here you will want to search for genera instead of species. Copy this format below for the `assets/species-table.csv` table:

speciesName | status | fbSpecCode | validName | class | order | family | genus | commonName | commonSpecies
----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | ----- | -----
Anguilla | accepted name | NA | Anguilla | Actinopterygii | Anguilliformes | Anguillidae | Anguilla | NA | NA

* **Can I make a reference library for a taxonomic group that isn't fishes?** - At the moment I  use the [rfishbase](https://docs.ropensci.org/rfishbase/index.html) package to generate higher taxonomic ranks and validate scientific names etc, because this is the best source of data for fishes. However, more general solutions could easily be employed using the [taxize](https://docs.ropensci.org/taxize/) package or [taxadb](https://docs.ropensci.org/taxadb/index.html) package, with minimal changes to the code. One thing to bear in mind is that the hidden Markov models were designed on fishes, and while these would probably work well for other vertebrates, they would need to be recreated for other groups (see below).
* **How do I get synonyms?** - Run `scripts/get-species.R` to generate an annotated species/synonyms list for a given country using the [rfishbase](https://docs.ropensci.org/rfishbase/index.html) package (see option 2 in the example above). This uses the `synonyms()` function in the [rfishbase](https://docs.ropensci.org/rfishbase/index.html) package, but the [taxize](https://docs.ropensci.org/taxize/) package or [taxadb](https://docs.ropensci.org/taxadb/index.html) package would achieve similar results for other groups.
* **How do I add a new metabarcode?** - First I downloaded the fish mitochondrial genomes and annotations from Prof. Masaki Miya's MitoFish website at [mitofish.aori.u-tokyo.ac.jp/](http://mitofish.aori.u-tokyo.ac.jp/), and extracted the genes of interest and aligned them with mafft. Then I searched for the primer sequences and cut out the fragments of interest using [Geneious](https://www.geneious.com/prime/) and exported as fasta. Then I ran the hmmer function `hmmbuild` to create the hidden Markov models. Unfortunately, I did not include the code to perform these steps as it is not really general enough to be useful (requires manual actions and checking). Please contact me if you need specific help with these.
* **What if I want more than fishes?** - Indeed, for many metabarcoding applications you would want to identify 'off-target' reads, so a wider reference library is required as a supplement to the one presented here. I use the NCBI RefSeq mitochondrial DNA database ([ftp://ftp.ncbi.nlm.nih.gov/refseq/release/mitochondrion](ftp://ftp.ncbi.nlm.nih.gov/refseq/release/mitochondrion)), which should have a sufficiently broad coverage to roughly classify most eukaryote mtDNA.
* **How does the exclusions blacklist file work?** -  The file `assets/exclusions.csv` is permanently available on this GitHub repository, and contains all the accessions that have been flagged by me as potentially erroneous, as part of the work on the UK fish reference library. New records are added manually each time a new GenBank version becomes available and the quality control steps are performed. When the `scripts/references-clean.R` script is run, the exclusion file is called and these blacklisted accessions are removed from the library. The user does not need to regenerate or interact with this exclusions file if they are simply wanting to use the UK reference library as provided. If the user wishes to create their own custom reference library then they have the option of tailoring the contents of this exclusions file to their own requirements by keeping, deleting, or adding accessions to it.
* **How does the taxonomic changes file work?** -  The file `assets/taxonomy-changes.csv` allows you to make your own custom changes to names, if for example, the same species is represented under multiple different names in GenBank due to historic taxonomic uncertainty. Here, simply change the amended name to reflect the new name you require, and they will be automatically changed when `scripts/references-clean.R` is run.
* **Is the reference library guaranteed error free?** - LOL, no! I have tried to curate a reliable reference library as best as I can. However, the phylogenetic quality control step is tedious and subjective and takes a lot of effort. Here, phylogenetic QC trees for each primer set need to be manually checked. To help with this tips are coloured by monophyly and haplotype sharing to visually assist identifying dubious accessions. This is a much easier task for loci where taxa are well differentiated and large numbers of sequences exist (such as for COI). It is not easy for ribosomal fragments with fewer informative nucleotides and fewer sequences. The choice of which accessions to blacklist in `assets/exclusions.csv` has been entirely at my discretion thus far. However, I hope I have caught the majority of the most egregious examples. As a rule of thumb, an accession is blacklisted if: (a) individual(s) of species x are identical to or nested within a cluster of sequences of species y, but with other individuals of species x forming an independent cluster; and (b) the putatively spurious sequences coming from a single study, while the putatively correct sequences of species x and y coming from multiple studies. It is important to note that this is far from foolproof, and many species will naturally be non-monophyletic and/or share haplotypes with other species. I tried to be conservative, and not remove too many sequences if there was doubt, and especially so for taxa that I am not familar with. Mistakes certainly remain, so I recommend running the QC step to check yourself (or email me for the trees). [NCBI blast](https://blast.ncbi.nlm.nih.gov/Blast.cgi) is also useful for checking for matches against species not in the reference library. 
* **How do I cite the reference library?** - Zenodo DOIs for each version are in see [Releases](https://github.com/genner-lab/meta-fish-lib/releases). An important note: the reference library and code presented here supercedes a previous iteration hosted at [github.com/boopsboops/reference-libraries](https://github.com/boopsboops/reference-libraries). The new version here starts at v241, but I have archived only the final reference library file (`assets/reference-library-master.csv.gz`) for the previous versions here also. Therefore, while the library files are here, the old code used to generate these libraries prior to v241 are not archived together with that library version here. You can also cite the Collins et al. (2021) _Journal of Fish Biology_ article ([https://doi.org/10.1111/jfb.14852](https://doi.org/10.1111/jfb.14852)) describing the software.
* **The search step takes too long, hangs, or errors!** - The GenBank search step relies on NCBI servers, and if they are overloaded then the searches can fail. I suggest: (i) reducing the number of threads ("-t" option in the `scripts/sequences-download.R` step) to lower the frequency of requests; (ii) running searches at USA off-peak times; (iii) disabling the exhaustive search option (use "-e false" instead of "-e true" in the `scripts/sequences-download.R` step), which searches for fewer search terms, will take less time and consume less RAM and disk space, but will give you 99% of the sequences; (iv) making each concatenated search string length longer (or shorter) with the "-q" option; and (v) requesting only the metabarcodes that you are interested in (use the "-m" option in the `scripts/references-assemble.R` step).
* **The phylogenetic quality control steps takes too long!** - Making ML trees for many taxa can take a very long time. Here, the largest one (Ward COI) is now over 10,000 haplotypes, and takes over 12 h to run. If your dataset is too big, I suggest: (i) skipping this step if you aren't sure you need it; (ii) requesting only the metabarcodes that you are interested in (use the "-m" option in the `scripts/references-assemble.R` step); or (iii) maybe break up the species input list into smaller chunks and merge the tables later.
* **Why not use [sativa](https://github.com/amkozlov/sativa) for automated quality control?** - Good question.  Software such as [sativa](https://github.com/amkozlov/sativa) is available to automate the process, and while I may investigate this option in the future, for the meantime I think it is always a good idea to eyeball and become familiar with your data and develop an informed judgement.
* **What are the 'dbid' numbers?** - The 'dbid' column provides database identification numbers. For NCBI these are 'GI' numbers (GenInfo Identifiers); these are equivalent to NCBI accession numbers, and will resolve accordingly on NCBI services; for BOLD, these are the 'processid' numbers. 


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
    - **`hmms/`** - Hidden Markov models (HMMs) of gene markers of interest.
    - `collins2021_submitted_jfb.pdf` - preprint copy of paper describing software
    - `exclusions.csv` - unreliable accessions to be excluded 
    - `logo.svg` - project logo
    - `reference-library-master.csv.gz` - master copy of the reference library
    - `reports-tables.md` - species coverage reports
    - `species-list-synonyms.md` - tutorial and R code to generate species lists and synonyms
    - `species-table.csv` - list of species to search for
    - `species-table-testing.csv` - a test list of goby species
    - `taxonomy-changes.csv` - custom table to change species names
* **`renv/`** - Settings for the R environment.
* **`reports/`** - Location of QC reports. Temporary directory that is not committed to the repository, but needs to be created locally to run the scripts. Ignored by git.
* **`scripts/`** - R and shell scripts.
    - `check-genbank.R` - script to get genbank versions
    - `clean-derep-write.R` - script to clean sequences, dereplicate, length filter, and write out
    - `load-libs.R` - script to load all required packages and functions
    - `Makefile` - makefile to generate the species coverage reports
    - `qc.R` - quality control a reference library
    - `references-assemble.R` - extract and annotate reference libraries from ncbi/bold dumps 
    - `references-clean.R` - quality filter reference library
    - `references-load-local.R` - load reference library locally
    - `references-load-remote.R` - load reference library remotely
    - `reports-tables.Rmd` - knitr file to prepare species coverage reports
    - `sequences-download.R` - pulls all mitochondrial DNA from NCBI and BOLD for a list of species
* **`temp/`** - Temporary file directory that is not committed to the repository, but needs to be created locally to run the scripts. Ignored by git.
* `LICENSE` - Legal stuff
* `README.md` - This file
* `renv.lock` - R packages required and managed by renv
* `.gitignore` - files and directories ignored by git
* `.Renviron` - contains NCBI key (ignored by git)
* `.Rprofile` - activates renv
* `.R-version` - required version of R (used by renv-installer)
