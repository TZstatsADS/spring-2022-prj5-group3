#   ____________________________________________________________________________
#   UI                                                                      ####

# Install and load related packages 
source("helpers_ui.R")
source("global.R")



ui <- navbarPage(
  title = "Anime",
  footer = includeHTML("footer.html"),
  fluid = TRUE, 
  collapsible = TRUE, 
  
  tags$head(
    tags$style(type = 'text/css', 
    HTML('.navbar { background-color: #fa9b8f; 
    font-family: "Chalkduster"; font-size: 15px; font-weight: bold}
    .navbar-default .navbar-brand{color: white; font-size: 25px}
    .tab-panel{ background-color: #fa9b8f; color: white}
    .navbar-default .navbar-nav > .active > a, 
    .navbar-default .navbar-nav > .active > a:focus, 
    .navbar-default .navbar-nav > .active > a:hover {
    color: white; 
    background-color: #847df9; 
         }')
    )
    ),
  
  
  # ----------------------------------
  # tab panel 1 - Home
  tabPanel("Home",
           includeHTML("home.html") 
           ), 
  
  
  # ----------------------------------
  # tab panel 2 
  tabPanel("Introduction",
           fluidPage(
             fluidRow(
               selectInput("sort", label = h3("Sort by"),
                           choices = c("Score" = "Score", 
                                        "Popularity" = "Popularity", 
                                        "Favorites" = "Favorites", 
                                        "Watching" = "Watching")
                           ),
               dataTableOutput('sort_table')
               
               
             ), # end fluidRow
             fluidRow(
               column(3,
                      wellPanel(
                        h4("Find the top rated anime by type and genre"),
                        selectInput("Genre", "Select anime genre : ",
                                    c("All", "Action", "Adventure", "Cars", "Comedy", "Dementia",     
                                      "Demons", "Drama", "Ecchi", "Fantasy", "Game",         
                                      "Harem", "Hentai", "Historical", "Horror", "Josei",       
                                      "Kids", "Magic", "Martial Arts", "Mecha", "Military",     
                                      "Music", "Mystery", "Parody", "Police", "Psychological",
                                      "Romance", "Samurai", "School", "Sci-Fi", "Seinen",       
                                      "Shoujo", "Shoujo Ai", "Shounen", "Shounen Ai", "Slice of Life",
                                      "Space", "Sports", "Super Power", "Supernatural", "Thriller",     
                                      "Unknown", "Vampire", "Yaoi", "Yuri" )
                        ),
                        selectInput("Type", "Select anime type: ",
                                    c("All","Movie", "Music", "ONA", "OVA", "Special", "TV", "Unknown")
                        )
                        
                      )
               ),
               dataTableOutput("table_1")
             ) # end fluidRow 
           ) # end fluidPage
           ), # end tabPanel
  
  
  
  
  # ----------------------------------
  # tab panel 3 - Recommendation 
  tabPanel("Recommendation"
  ),
                 
                 
                  
  # tab panel 5 - About
  tabPanel("About",
           includeHTML("about.html"), 
           shinyjs::useShinyjs(), 
           tags$head(
             tags$link(rel = "stylesheet", 
                       type = "text/css", 
                       href = "plugins/carousel.css"),
             tags$script(src = "plugins/holder.js")
             ),
           tags$style(type="text/css",
                      ".shiny-output-error { visibility: hidden; }",
                      ".shiny-output-error:before { visibility: hidden; }"
                      )
           )

                  
)   #end navbarpage




