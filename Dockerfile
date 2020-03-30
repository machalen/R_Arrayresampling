#################################################################
# Dockerfile
# Description:      R and necessary packages to run an R statistical test for a project
# Base Image:       r-base:3.6.3
#################################################################
#R image to be the base in order to build our new image
FROM r-base:3.6.3

#Maintainer and author
MAINTAINER Magdalena Arnal <mgdrnl@gmail.com>

#Install Ubuntu extensions in order to run r
RUN apt-get update && apt-get install -y \
    r-cran-xml \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev
    
ENV PATH=pkg-config:$PATH


#Install Bioconductor package manager
RUN Rscript -e 'if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")'

#Install Bioconductor packages first
RUN Rscript -e 'BiocManager::install(c("sva","Biobase","limma", "BiocGenerics","affxparser","affy", "affyPLM", "aroma.light", "gcrma", "oligo", "oligoClasses", "pdInfoBuilder", "preprocessCore", "AffymetrixDataTestFiles", "DNAcopy", "RBGL","graph", "qvalue"))'

#Install packages from CRAN
#RUN Rscript -e 'install.packages(c("R.utils","data.table", "gtools", "gplots"))'

