install.packages("tidyverse")
library(tidyverse)
library("dplyr")


data <- read.csv("./dataset/best_swimmers.csv", sep = ",")

swimmers_per_team <- data %>% 
  filter(Gender == "F" & Swim.date > "01-01-1998") %>% 
  group_by(Team.Code,Team.Name) %>% 
  transmute(
    Team.Code = as.factor(Team.Code),
    id.team.code = as.factor(Team.Code),
    id.team.code = as.integer(id.team.code)
    ) %>% 
  summarise(
    addition_team = sum(id.team.code)
  ) %>% 
  arrange(desc(addition_team))
#with to verb arrange can reordere dataframes 

View(swimmers_per_team)
