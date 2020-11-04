# miRmapper
miRmapper is an R package for analyzing the predicted impact that micro RNAs have on the post transcriptional regulation of mRNAs.
The user will provide the list of miRNAs of interest and the predicted target genes for each,
as well as a list of the differentially expressed genes from the sequencing experiment. miRmapper will generate metrics and plots of the interactions.
 

# Installation
You can install `miRmapper` using the `devtools` package as such:
```coffee
# Prerequisites on Linux - Install tcl and tcl tk on your system

if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
library(devtools)
devtools::install_github("HardimanLab/miRmapper")
library(miRmapper)
```
