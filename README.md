# finalproject

Find the app here:

https://nels6906.shinyapps.io/minnie_map_app/


STAT 360 Group Project Documentation


Project Outline

Our final project deliverable will be an R Shiny app that will allow the user to view an interactive map of the Twin Cities light rail public transportation grid. The application will use clustering parameters that will be used to generate the most efficient (defined in methodology) public transportation lines based on a chosen “train stop.” The train stops will be non-traditional stop locations that ideally consist of franchises of fast food restaurants, coffee shops, other stores, etc. The "train stop" functionality of the Shiny App will resemble Google's Maps service, so users will be able search for the map locations by simply typing the location or set of locations' name in the App.  This map is not intended to be the future direction of the Metro Transit organization, but rather will put into perspective the spread and reach of these "train stop" map locations. 

Data Collection

Our methodology for creating the R Shiny App will consist of mainly five packages: Tidyverse to perform any data collection and manipulation, leaflet to visualize maps and graph transit routes of the twin cities area, googleway to collect the location data, geosphere to determine distances for our starting point to select location points, and Shiny to develop our application.

To determine the transit routes, K-means clustering is used to select locations for the route to follow. K-means is a clustering technique that creates clusters based on minimizing the variation with each cluster. This serves to create clusters where the data points  within each cluster are the most homogeneous. In our application, the homogeneity of data points refers to locations being the most similar in terms of latitude and longitude (i.e. the closest to each other). Each cluster of data locations will be used to create a light rail train transit route. The number of transit routes (and thus the number of clusters) is determined by the app user.

Methodology

Our methodology for creating the R Shiny App will consist of mainly five packages: Tidyverse to perform any data collection and manipulation, leaflet to visualize maps and graph transit routes of the twin cities area, googleway to collect the location data, geosphere to determine distances for our starting point to select location points, and Shiny to develop our application.

To determine the transit routes, K-means clustering is used to select locations for the route to follow. K-means is a clustering technique that creates clusters based on minimizing the variation with each cluster. This serves to create clusters where the data points  within each cluster are the most homogeneous. In our application, the homogeneity of data points refers to locations being the most similar in terms of latitude and longitude (i.e. the closest to each other). Each cluster of data locations will be used to create a light rail train transit route. The number of transit routes (and thus the number of clusters) is determined by the app user.

As mentioned in the methodology, the set of locations that are considered in mapping each light rail route are clustered using K-Means clustering. When a cluster of locations was determined, the center of the cluster became the end point for that individual route. Once all of the cluster center's were determined, the starting point for all of the routes was determined as the midpoint for each of these cluster centers. This starting point for all routes can be thought of as the light rail system's center hub. 

Mapping

Each route between the starting central hub and the end point follows the fastest vehicle path. The route is created using the google_directions function of the googleway package. The route that is created matches the same route that would be created if you used the same start and end point in the Google Maps applications and selected the car directions options. It is our understanding that the traffic conditions that are factored into the "fastest route" calculated are real-time traffice conditions as of when the code is run.

Goals


App Instructions




Group Members

Ryan Nelson, Peter Roessler-Caram, Michael Schatzel, Jimmy Kroll, and Trevor Tracy
