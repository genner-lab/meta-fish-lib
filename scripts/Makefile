# makefile for generating species reference library scripts from GenBank searches and tissues collected
# Rupert Collins, Aug 2021
# http://swcarpentry.github.io/make-novice/02-makefiles/

# format
# output : dependences
# commands (preceded by a tab)

# to execute, simply run "make" in the terminal from the scripts dir
 
reports/reports-tables.md : scripts/reports-tables.Rmd assets/reference-library-master.csv.gz
	Rscript -e "require('rmarkdown'); rmarkdown::render(input='scripts/reports-tables.Rmd', output_dir='reports/')"
