# Bioconductor Notes
# Commits prefixed with "bioc"

# List of packages and brief discription of what they do
#   Biostrings          Represent biological sequences and match algorithms

# Install Bioconductor
source("https://bioconductor.org/biocLite.R")
biocLite()

# Install packages
biocLite("Biostrings")

# HTTPS not working?
options(useHTTPS=FALSE, BioC_mirror="http://bioconductor.org")
