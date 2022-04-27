# Data Processing

# read data

if (!require("dplyr")) {
  install.packages("dplyr")
  library(dplyr)
}
if (!require("jsonlite")) {
  install.packages("jsonlite")
  library(jsonlite)
}
if (!require("stringr")) {
  install.packages("stringr")
  library(stringr)
}
if (!require("r2r")) {
  install.packages("r2r")
  library(r2r)
}
if (!require("Hmisc")) {
  install.packages("Hmisc")
  library(Hmisc)
}

anime <- read.csv('./www/data/anime.csv')
anime1 <- read.csv('./www/data/anime.csv')

animes <- read.csv("https://raw.githubusercontent.com/OkeydokeyWang/gr5243_nvc_data_files/main/animes.csv")
profiles <- read.csv("https://raw.githubusercontent.com/OkeydokeyWang/gr5243_nvc_data_files/main/profiles.csv")

anime <- anime %>% 
  filter(Score != "Unknown" & Episodes != "Unknown" & Popularity != "Unknown" & 
           Favorites != "Unknown" & Watching != "Unknown") 

anime1 <- anime1 %>% 
  filter(Score != "Unknown" & Episodes != "Unknown" & Popularity != "Unknown" & 
           Favorites != "Unknown" & Watching != "Unknown") 

get_anime_genre <- function(row) {
  fromJSON( str_replace_all(row$genre, "\'", "\""))
}

get_user_fav <- function(row) {
  rev(fromJSON(str_replace_all(row$favorites_anime, "\'", "\"")))
}

get_anime_row_by_id <- function(id) {
  filter(animes, uid == id)[1, ]
}

get_anime_title_by_id <- function(id) {
  filter(animes, uid == id)[1, ]$title
}

get_anime_id_by_title <- function(t) {
  as.character(filter(animes, title == t)[1, ]$uid)
}

construct_n_gram <- function(anime_id_list, n) {
  if (length(anime_id_list) < n) {
    return(c())
  } else {
    final_table <- data.frame()
    for (i in 1:n-1) {
      shifted_list <- Lag(anime_id_list, i)
      final_table <- rbind(shifted_list,final_table)
    }
    
    t(as.matrix(final_table[, n:length(final_table)]))
  }
}

get_ngram_key <- function(ids) {
  toJSON(ids,pretty=TRUE,auto_unbox=TRUE)
}


N <- 3
library(hash)
counts_hashmap <- hash()
choices_hashmap <- hash()

for (n in 1:N) {
  # count (n)
  for (i in 1:4000){#nrow(profiles)) {
    user_profile_row <- profiles[i,]
    fav_list <- get_user_fav(user_profile_row)
    ngrams_table <- construct_n_gram(fav_list, n)
    if (!is.null(ngrams_table)) {
      for (j in 1:nrow(ngrams_table)) {
        key_string <- get_ngram_key(ngrams_table[j, ])
        if(is.null(counts_hashmap[[key_string]])) {
          counts_hashmap[[key_string]] <- 1
        } else {
          counts_hashmap[[key_string]] <- counts_hashmap[[key_string]] + 1
        }
        if (n != 1) {
          # Add all posible choices for the input
          key_string_choices <- get_ngram_key(ngrams_table[j, 1:(n-1)])
          candidate <- ngrams_table[j, n]
          if(is.null(choices_hashmap[[key_string_choices]])) {
            choices_hashmap[[key_string_choices]] <- c(candidate)
          } else {
            choices_hashmap[[key_string_choices]] <- cbind(choices_hashmap[[key_string_choices]], candidate)
          }
        }
      }
    }
  }
}

get_next <- function(existing_ids) {
  key <- get_ngram_key(existing_ids)
  
  result_df <- data.frame(matrix(ncol = 4, nrow = 0))
  colnames(result_df) <- c("uid", "pct", "genre", "popularity")
  if (is.null(choices_hashmap[[key]])){
    result_df
  } else {
    candidates <- choices_hashmap[[key]]
    #print("Here are users choices:")
    total <- 1
    for (candidate in candidates) {
      combined <- rbind(as.matrix(existing_ids), as.matrix(candidate))
      cand_count <- counts_hashmap[[get_ngram_key(t(combined)[1,])]]
      total_count <- counts_hashmap[[key]]
      #cat(cand_count/total_count * 100, "% users went with ", get_anime_title_by_id(candidate), get_anime_row_by_id(candidate)$genre, "\n")
      total <- total - cand_count/total_count
      
      result_df <- rbind(result_df, c(candidate, cand_count/total_count, get_anime_row_by_id(candidate)$genre, get_anime_row_by_id(candidate)$popularity))
    }
    #cat(total * 100, "% of user last fav-ed this anime\n")
    colnames(result_df) <- c("uid", "pct", "genre", "popularity")
    result_df$pct <- as.numeric(result_df$pct)
    result_df <- aggregate(. ~ uid + genre + popularity, data = result_df, max)
    result_df[order( -as.numeric(result_df$pct), as.numeric(result_df$popularity) ),]
  }
}
