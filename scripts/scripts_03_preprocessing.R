# 03_preprocessing.R
# Preprocessing and derived measures

library(dplyr)

centroids <- schaefer17_100 %>%
  group_by(region) %>%
  summarize(
    long = mean(long, na.rm = TRUE),
    lat  = mean(lat,  na.rm = TRUE)
  )

# Merge genotype and fMRI data
merged <- fmri %>%
  left_join(comt, by = "participant_id")
