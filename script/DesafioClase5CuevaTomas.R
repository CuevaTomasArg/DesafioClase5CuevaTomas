#Quiero saber cual es el pais con más nadadores dentro de este ranking
install.packages("tidyverse")
library("tidyverse")
library("dplyr")
data <- read.csv("./dataset/best_swimmers.csv", sep = ",")
vector_team_code <- data %>% 
  select(Team.Code)
vector_team_code <- as.vector(vector_team_code)

df_cant_swimmers_team <- data %>% 
  group_by(Team.Code) %>% 
  mutate(
    id.team.code = as.factor(Team.Code),
    id.team.code = as.integer(id.team.code)
    ) %>% 
  summarise(
    addition_team = sum(id.team.code)
  )

View(df_cant_swimmers_team)

for(i in vector_team_code){
  print(i)
}

?order
