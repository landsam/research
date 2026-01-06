# 02_load_data.R
# Load atlases and raw data

library(ggseg)
library(tidyverse)

# Schaefer atlas
data(schaefer17_100)

# COMT genotype data
comt <- read_excel("data/COMT_gene.xlsx")

# fMRI segregation data
fmri <- read_csv("data/abcd_segr_intr_gordon_betnet_copy2.csv")
