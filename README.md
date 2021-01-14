# miRmapper
miRmapper is an R package for analyzing the predicted impact that micro RNAs have on the post transcriptional regulation of mRNAs.
The user will provide the list of miRNAs of interest and the predicted target genes for each,
as well as a list of the differentially expressed genes from the sequencing experiment. miRmapper will generate metrics and plots of the interactions.


# Native R Installation
You can install `miRmapper` using the `devtools` package as such:
```R
# Prerequisites on Linux - Install tcl and tcl tk on your system

# Install Dependencies from CRAN
install.packages("devtools", repos='https://cloud.r-project.org/')

# Install miRmapper
devtools::install_github("HardimanLab/miRmapper")

# Load package
library(miRmapper)
```

# Run miRmapper with Docker
To start an interactive `miRmapper` session and mount the current <br/>
working directory, `$PWD`, within the `Docker` container to /home/mirmapper/ <br/>
Run the following:
```dockerfile
docker run -v "$PWD:/home/mirmapper/" --rm -it hardimanlab/mirmapper
```
<sub>*Note that the --rm flag means that the container will autoremove <br/>
after you close the miRmapper session.*</sub> <br/>

# Links
[miRmapper - GitHub](https://github.com/HardimanLab/miRmapper)<br/>
[miRmapper - DockerHub](https://hub.docker.com/r/hardimanlab/mirmapper)
