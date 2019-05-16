library(tidyverse)
library(googleway)
library(leaflet)
library(geosphere)
library(dplyr)

search_locations <- function(user_location) {

  # Define constant values 
  key <- "AIzaSyDea9BHdMYeXvLUjJObACk2Ox8ofse2m68"
  rad<-10000
  origin<-c(44.97566,-93.2696761)
  max.page<-3
  i<-1
  
  # Initialize vectors that will collect, filter, and clean coordinates
  raw_data<-NULL
  raw_data2<- NULL
  filtered_data<-NULL
  filtered_points <- NULL
  clean_data <- NULL
  
  for (i in 1:max.page){
    if(i == 1){
      raw_data <- google_places(search_string = user_location, location = origin, radius = rad, key = key)
    }
    else{
      raw_data <- google_places(search_string = user_location, location = origin, radius = rad, key = key, page_token = token)
    }
    token<-raw_data$next_page_token
    raw_data2<-raw_data$results[2]$geometry$location
    filtered_data<-bind_rows(filtered_data,raw_data2)
    Sys.sleep(3)
  }
  
  ##Clean coordinates to prepare for plotting
  clean_data<-filtered_data
  clean_data[,2]<-clean_data[,2]+90
  
  ##Adjust longitude set, reset radius and origin
  rad <- 16100
  origin <- c(44.97566,-3.2696761)
  
  #Adjust the dataset to finalize the output of coordinates we will use in the leaflet
  filtered_points <- clean_data %>% 
    filter(!distm(origin, clean_data[,], fun = distHaversine)>rad)
  
  return(filtered_points)
}


