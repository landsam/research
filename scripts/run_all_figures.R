############################################
# Figures 1–5: COMT Genotype & fMRI Analysis
# Student Research Project
############################################

# ---- 1. Load required libraries ----
library(ggplot2)
library(dplyr)
library(tidyr)

# ---- 2. Load processed data ----
# (These should already exist from your earlier analysis)
# Adjust paths only if needed

merged_data <- read.csv("data/processed/merged_data.csv")
heatmap_data <- read.csv("data/processed/heatmap_data.csv")
longitudinal_data <- read.csv("data/processed/longitudinal_data.csv")

# Ensure factors are consistent
merged_data$COMT_group <- factor(
  merged_data$COMT_group,
  levels = c("Met/Met", "Val/Met", "Val/Val")
)

# =========================================================
# Figure 1: Genetic Distribution by Sex (Bar Plot)
# =========================================================

fig1 <- ggplot(merged_data, aes(x = SEX, fill = COMT_group)) +
  geom_bar(position = "dodge") +
  labs(
    title = "Genetic Distribution by Sex",
    x = "Sex",
    y = "Count",
    fill = "Genotype"
  ) +
  theme_minimal()

print(fig1)

# =========================================================
# Figure 2: Cingulo-Parietal Segregation by COMT Group
# =========================================================

fig2 <- ggplot(
  merged_data,
  aes(
    x = COMT_group,
    y = cingulo_parietal_segregation,
    fill = COMT_group
  )
) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(
    title = "Comparison of cingulo-parietal segregation by COMT Group",
    x = "COMT Group",
    y = "Cingulo-parietal Segregation"
  ) +
  theme_minimal()

print(fig2)

# =========================================================
# Figure 3: DAN Segregation by COMT Group
# =========================================================

fig3 <- ggplot(
  merged_data,
  aes(
    x = COMT_group,
    y = dan_segregation,
    fill = COMT_group
  )
) +
  geom_violin(trim = FALSE) +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(
    title = "Comparison of dan_segregation by COMT Group",
    x = "COMT Group",
    y = "DAN Segregation"
  ) +
  theme_minimal()

print(fig3)

# =========================================================
# Figure 4: Heatmap of Resting-State Functional Connectivity
# =========================================================

fig4 <- ggplot(
  heatmap_data,
  aes(
    x = Genotype,
    y = Brain_Network,
    fill = Segregation_Metric
  )
) +
  geom_tile(color = "white") +
  facet_wrap(~ SEX) +
  scale_fill_gradient(low = "white", high = "darkorange") +
  labs(
    title = "Resting-State Functional Connectivity by Genotype and Sex",
    x = "Genotype",
    y = "Brain Network",
    fill = "Segregation Metric"
  ) +
  theme_minimal()

print(fig4)

# =========================================================
# Figure 5: Spaghetti Plot (Scan 1 vs Scan 2)
# =========================================================

fig5 <- ggplot(
  longitudinal_data,
  aes(
    x = Scan,
    y = cingulo_parietal_segregation,
    group = participant_id
  )
) +
  geom_line(alpha = 0.1) +
  labs(
    title = "Cingulo-parietal Segregation Across Scans",
    x = "Scan",
    y = "Cingulo-parietal Segregation"
  ) +
  theme_minimal()

print(fig5)
