##User Defined Function
Map_clusters <- function(df, main_clusters, sub_clusters){
  
  clers <- kmeans(df, centers = main_clusters)
  df2 <- cbind(df[,1], df[,2], clers$cluster)
  
  
  sub_clers <- vector("logical", length =100)
  sub_df <- NULL
  for(i in 1:sub_clusters){
    
    sub_df[i] <- subset(df2, df2[,3] == i)
    
    sub_clers[i] <- kmeans(sub_df[i], sub_clusters)
    
    
    df3[i] <- cbind(sub_df[,1][i], sub_df[,2][i], sub_df[,3][i], sub_clers$clusters[i])
    
  }
  
  
  df4 <- data.frame(df3)
  
  
  print(df4)
}