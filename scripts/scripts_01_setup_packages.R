# 01_setup_packages.R
# Install and load required packages

options(repos = c(
  ggseg = "https://ggseg.r-universe.dev",
  CRAN  = "https://cloud.r-project.org"
))

required_packages <- c(
  "ggseg",
  "ggplot2",
  "tidyverse"
)

for (pkg in required_packages) {
  if (!require(pkg, character.only = TRUE)) {
    install.packages(pkg)
    library(pkg, character.only = TRUE)
  }
}
