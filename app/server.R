#   ____________________________________________________________________________
#   Server                                                                  ####

# Install and load related packages 
source("helpers_server.R")
source("global.R")


### . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..
### Pretty-print function                                                   ####

anime <- read.csv('www/data/anime.csv')
#anime_synopsis <- read.csv('www/data/anime_with_synopsis.csv')



server <- function(input, output) {
  

  output$table_1 <- renderDataTable({
    
    # Optional: filter by genre
    if (input$Genre != "All") {
      anime <- anime %>%
        separate_rows(Genres, sep = ",") %>% 
        mutate(Genres = str_trim(Genres, side = "both")) %>%
        filter(Genres == input$Genre)
    }

 # ------------------------- Introduction ---------------------------
  
  output$sort_table <- renderDataTable({
    anime_sort <- anime[order(anime[, input$sort], decreasing = T), ] 
    anime_sort %>%
      dplyr::select(Name, Japanese.name, Genres, Type, Rating, input$sort)
  }
  )

  
    # Optional: filter by type
    if (input$Type != "All") {
      anime <- anime %>% filter(Type == input$Type)
    }
    
    anime <- anime %>%
      dplyr::select(MAL_ID:Rating) %>%
      filter(Score != "Unknown") %>%
      dplyr::select(Name, Score, Episodes, Aired) %>%
      arrange(desc(Score))
    
    anime[1:50, ]
  })

      
} # server end














