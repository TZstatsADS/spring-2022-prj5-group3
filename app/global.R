# Data Processing

# read data
library(tidyverse)
anime <- read.csv("../data/anime.csv")

anime <- anime %>% 
  filter(Score != "Unknown" & Episodes != "Unknown" & Popularity != "Unknown" & 
           Favorites != "Unknown" & Watching != "Unknown") 

