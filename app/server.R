#   ____________________________________________________________________________
#   Server                                                                  ####

# Install and load related packages 
source("helpers_server.R")
source("global.R")


### . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..
### Pretty-print function                                                   ####

# server <- function(input, output){
#   options(shiny.maxRequestSize=60*1024^2)
# }


server <- function(input, output) {

# ------------------------- Introduction ---------------------------

  output$table_1 <- renderDataTable({
    
    # Optional: filter by genre
    if (input$Genre != "All") {
      anime <- anime %>%
        separate_rows(Genres, sep = ",") %>% 
        mutate(Genres = str_trim(Genres, side = "both")) %>%
        filter(Genres == input$Genre)
    }

  
    # Optional: filter by type
    if (input$Type != "All") {
      anime <- anime %>% filter(Type == input$Type)
    }
    
    anime <- anime %>%
      dplyr::select(MAL_ID:Rating) %>%
      dplyr::select(Name, Score, Episodes, Aired) %>%
      arrange(desc(Score))
    
    anime[1:50, ]
  })
  
  output$sort_table <- renderDataTable({
    anime_sort <- anime[order(anime[, input$sort], decreasing = T), ] 
    anime_sort %>%
      dplyr::select(Name, Japanese.name, Genres, Type, Rating, input$sort)
  }
  )
  
  recommended_df <- reactive({
    if (is.na(get_anime_id_by_title(input$first_anime))) {
      return(" (=‐ω‐=)... Interesting. I haven't seen that first anime before")
    } else {
      if (is.na(get_anime_id_by_title(input$second_anime))) {
        a = " (=‐ω‐=)... Interesting. I haven't seen that second anime before\n"
        b = "Here are list of animes users liked after "
        c = input$first_anime
        d = ":\n"
        # Go with bi-gram
        cat(c(a,b,c,d))
        df <- get_next(c(get_anime_id_by_title(input$first_anime)))
        df
      } else {
        # Go with tri-gram
        df <- get_next(c(get_anime_id_by_title(input$second_anime), c(get_anime_id_by_title(input$first_anime))))
        b = "Here are list of animes users liked after "
        c = input$second_anime
        c1 = " and "
        c2 = input$first_anime
        d = ":\n"
        # Go with bi-gram
        cat(c(b,c,c1,c2,d))
        df
      }
    }
  })
  
  output$recommended_text <- renderPrint({
    a <- recommended_df()
  })
  
  output$my_rec01 <- renderText({
    a <- recommended_df()
    a$percentageOfUsers <- paste(a$pct * 100, "%")
    a$title <- sapply(a$uid, get_anime_title_by_id)
    a$image_url <- sapply(a$uid, get_anime_img_url_by_id)
    a$aired <- sapply(a$uid, get_anime_aired_by_id)
    a$score <- sapply(a$uid, get_anime_score_by_id)
    myRender(a, 1)
  })
  
  output$my_rec02 <- renderText({
    a <- recommended_df()
    a$percentageOfUsers <- paste(a$pct * 100, "%")
    a$title <- sapply(a$uid, get_anime_title_by_id)
    a$image_url <- sapply(a$uid, get_anime_img_url_by_id)
    a$aired <- sapply(a$uid, get_anime_aired_by_id)
    a$score <- sapply(a$uid, get_anime_score_by_id)
    if (is.na(a$title[2])){
      paste(" ")
    }
    else (
      myRender(a, 2)
    )
  })
  
  output$my_rec03 <- renderText({
    a <- recommended_df()
    a$percentageOfUsers <- paste(a$pct * 100, "%")
    a$title <- sapply(a$uid, get_anime_title_by_id)
    a$image_url <- sapply(a$uid, get_anime_img_url_by_id)
    a$aired <- sapply(a$uid, get_anime_aired_by_id)
    a$score <- sapply(a$uid, get_anime_score_by_id)
    if (is.na(a$title[3])){
      paste(" ")
    }
    else (
      myRender(a, 3)
    )
  })
  
  output$my_rec04 <- renderText({
    a <- recommended_df()
    a$percentageOfUsers <- paste(a$pct * 100, "%")
    a$title <- sapply(a$uid, get_anime_title_by_id)
    a$image_url <- sapply(a$uid, get_anime_img_url_by_id)
    a$aired <- sapply(a$uid, get_anime_aired_by_id)
    a$score <- sapply(a$uid, get_anime_score_by_id)
    if (is.na(a$title[4])){
      paste(" ")
    }
    else (
      myRender(a, 4)
    )
  })
  
  output$my_rec05 <- renderText({
    a <- recommended_df()
    a$percentageOfUsers <- paste(a$pct * 100, "%")
    a$title <- sapply(a$uid, get_anime_title_by_id)
    a$image_url <- sapply(a$uid, get_anime_img_url_by_id)
    a$aired <- sapply(a$uid, get_anime_aired_by_id)
    a$score <- sapply(a$uid, get_anime_score_by_id)
    if (is.na(a$title[5])){
      paste(" ")
    }
    else (
      myRender(a, 5)
    )
  })
  
  output$my_rec06 <- renderText({
    a <- recommended_df()
    a$percentageOfUsers <- paste(a$pct * 100, "%")
    a$title <- sapply(a$uid, get_anime_title_by_id)
    a$image_url <- sapply(a$uid, get_anime_img_url_by_id)
    a$aired <- sapply(a$uid, get_anime_aired_by_id)
    a$score <- sapply(a$uid, get_anime_score_by_id)
    if (is.na(a$title[6])){
      paste(" ")
    }
    else (
      myRender(a, 6)
    )
  })

      
} # server end














