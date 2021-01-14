FROM rocker/r-base:4.0.3

LABEL maintainer "Adam Harris"

# System dependencies
RUN apt-get update && apt-get install --no-install-recommends -y \
    pandoc \
    pandoc-citeproc \
    libcurl4-gnutls-dev \
    libcairo2-dev \
    libxt-dev \
    libssl-dev \
    libssh2-1-dev \
    libmpfr-dev \ 
    build-essential \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libssl-dev \
    libgit2-dev \ 
    && rm -rf /var/lib/apt/lists/

# R Packages
RUN R -e "install.packages(c('devtools', 'BiocManager'), repos='https://cloud.r-project.org/')"
RUN R -e "devtools::install_github('HardimanLab/miRmapper')"

# Copy Rprofile.site containing startup message
COPY Rprofile.site /usr/lib/R/etc/Rprofile.site

ENV R_DEFAULT_PACKAGES='compiler,graphics,utils,grDevices,stats,datasets,methods,base,miRmapper'

# Set working directory in container
WORKDIR "/home/mirmapper/"

# Run R
ENTRYPOINT ["R"]
