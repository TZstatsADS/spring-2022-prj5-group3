# Data Processing

# read data
anime <- read.csv('www/data/anime.csv')

anime <- anime %>% 
  filter(Score != "Unknown" & Episodes != "Unknown" & Popularity != "Unknown" & 
           Favorites != "Unknown" & Watching != "Unknown") 

