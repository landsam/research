# 05_figures.R
# Visualization

library(ggplot2)

ggplot(merged, aes(x = COMT_group, y = auditory_segregation)) +
  geom_boxplot() +
  theme_minimal()
