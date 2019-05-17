build_routes <- function(location_coords, num_routes){
  
  #Define key for Google API
  key <- "AIzaSyDea9BHdMYeXvLUjJObACk2Ox8ofse2m68"
  
  #Take input from user generated 'location_points' (input here as location_coords)
  filtered_coords_90 <- cbind(lat = location_coords[,1], lng = location_coords[,2]-90)
  
  #Create sub-clusters
  sub_clust <- kmeans(filtered_coords_90, centers = num_routes)
  
  #Create center of sub-cluster
  cent_sub_clust <- kmeans(sub_clust$centers, centers = 1)
  
  df_polyline<-NULL
  
  #Build routes using sub-clusters and output the routes in 'df_polyline'
  for(i in 1:num_routes){
    
    origin<- sub_clust$centers[i,]
    destination<- as.numeric(cent_sub_clust$centers)
    
    test.waypoints <- google_directions(origin = origin,
                                        destination = destination,
                                        key = key)
    
    df_polyline[[i]] <- decode_pl(test.waypoints$routes$overview_polyline$points)
  }
  
  return(df_polyline)
}