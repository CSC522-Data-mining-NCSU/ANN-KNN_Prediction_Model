#This file is used for read data.
#Set working environment
user_movie <- read.csv("user_movie.csv");
movie_ground <- read.table("movie_ground.txt");
movie_ground[[1]] <- NULL
movie_info <- read.csv("movie_titles_preprocessed.txt",sep="=")
movie_info[[1]] <- NULL
library(RCurl)

library(stringdist)
distanceMovies <- stringdistmatrix(movie_info$name,movie_info$name,method = "jw")
hc <- hclust(as.dist(distanceMovies))
dfClust <- data.frame(movie_info$name, cutree(hc, k = 1000))
names(dfClust) <- c('movie_name','cluster')
plot(table(dfClust$cluster))

