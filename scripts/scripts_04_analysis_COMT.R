# 04_analysis_COMT.R
# COMT polymorphism analysis

library(dplyr)

merged <- merged %>%
  mutate(
    COMT_group = case_when(
      genetic_code == "Met/Met" ~ "MetMet",
      genetic_code %in% c("Val/Met", "Val/Val") ~ "ValCarrier"
    )
  )

# Example t-test
t.test(
  auditory_segregation ~ COMT_group,
  data = merged
)
