# meta-fish-lib
A generalised, dynamic DNA reference library for metabarcoding of fishes

Admin
`mkdir reports temp`

Search GenBank
`scripts/sequences-download.R assets/species-table.csv 4`

Assemble
`scripts/references-assemble.R 2`

Commit 
`git add assets/reference-library-master.csv.gz`
`git commit -m "updated master"`
`git push`

QC
`scripts/qc.R 8 ~/Software/standard-RAxML/raxmlHPC-AVX`
