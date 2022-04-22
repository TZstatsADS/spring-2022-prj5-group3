#   ____________________________________________________________________________
#   UI                                                                      ####

library(shiny)
library(leaflet)
library(plotly)
library(shinyjs)
library(shinyBS)
library(dtplyr)
library(dplyr)
library(DT)
library(lubridate)
library(stringr)
require(rgdal)
require(ggplot2)
library(shinythemes)
library(broom)


### . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . ..
### Colors                                                                  ####

#C10250 purple
#03BCC0 green
#D2D945 yellow/green
#FCB040 orange
#FF5850 red
#436983 hipster blue




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
                   tabPanel("Events"
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
)
