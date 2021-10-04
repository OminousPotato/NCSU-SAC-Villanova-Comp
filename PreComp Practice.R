library(tidyverse)
library(ggplot2)

data <- read.csv("C:/Users/Brian/OneDrive/Documents/Programming/Sports Analytics Club/NCSU-SAC-Villanova-Comp/NC-State-Nova-Data-Viz-Challenge-2021-main")

sample <- select(data, c("team", "goals", "shot_attempts")) %>% 
  group_by(team) %>% 
  summarize(goals = sum(goals, na.rm = TRUE), shot_attempts = sum(shot_attempts, na.rm = TRUE)) %>% 
  ungroup() %>% 
  mutate(eff = goals / shot_attempts)

graph <- ggplot(data = sample,
       mapping = aes(
         x = team,
         y = eff
       )) + geom_bar(stat = "identity")

graph