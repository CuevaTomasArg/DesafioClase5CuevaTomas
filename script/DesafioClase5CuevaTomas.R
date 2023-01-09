#Quiero saber cual es el pais con más nadadores dentro de este ranking
install.packages("tidyverse")
library("tidyverse")
library("dplyr")


data <- read.csv("./dataset/best_swimmers.csv", sep = ",")
swimmers_per_team <- data %>% 
  group_by(Team.Code) %>% 
  mutate(
    Team.Code = as.factor(Team.Code),
    id.team.code = as.factor(Team.Code),
    id.team.code = as.integer(id.team.code)
    ) %>% 
  summarise(
    addition_team = sum(id.team.code)
  )
ordenation_swimmers = order(swimmers_per_team$addition_team,decreasing = TRUE)
swimmers_per_team = swimmers_per_team[ordenation_swimmers,]
View(swimmers_per_team)
