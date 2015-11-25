#This file is used for read data.
#Set working environment
user_movie <- read.csv("user_movie.csv");
movie_ground <- read.table("movie_ground.txt");
movie_ground[[1]] <- NULL
movie_info <- read.csv("movie_titles_preprocessed.txt",sep="=")
movie_info[[1]] <- NULL
library(RCurl)

#calculate the string distance, and then cluster the movie based on the strin distance
library(stringdist)
distanceMovies <- stringdistmatrix(movie_info$name,movie_info$name,method = "jw")
hc <- hclust(as.dist(distanceMovies))
dfClust <- data.frame(movie_info$name, cutree(hc, k = 1000))
names(dfClust) <- c('movie_name','cluster')
plot(table(dfClust$cluster))

#Create sample training and testing data
user_avg_rating <- read.table("user_avg_rating.txt")
movie_raw_info <- read.csv("movie_raw_info.csv")
sample <- read.csv("sample.csv")
sample_Y <- sample$rating
sample$movie_year <- movie_raw_info$year[sample$movie_id]
sample$movie_cluster <- movie_raw_info$cluster[sample$movie_id]
sample$movie_avgScore <- movie_raw_info$avgScore[sample$movie_id]
sample_X <- sample
sample_X$movie_id <- NULL
sample_X$user_id <- NULL
sample_X$rating <- NULL
sample_X$id <- NULL

#Create training data and testing data from sample data
#randomly select training data and test data
index <- sample(nrow(sample_X))
train_index <- index[1:70000]
X_train <- sample_X[train_index,]
Y_train <- sample_Y[train_index]

test_index <- index[70001:98058]
X_test <- sample_X[test_index,]
Y_test <- sample_Y[test_index]

write.csv(X_train,"X_train.csv")
write.csv(X_test,"X_test.csv")
write.csv(Y_train,"Y_train.csv")
write.csv(Y_test,"Y_test.csv")

write.csv(sample_X,"sample_X.csv",row.names = FALSE)
write.csv(sample_Y,"sample_Y.csv",row.names = FALSE)

install.packages('neuralnet')
library("neuralnet")
X_train = read.csv("X_train.csv")
Y_train = read.csv("Y_train.csv")

net.sqrt <- neuralnet(Y_train,X_train, hidden=10, threshold=0.01)
print(net.sqrt)

#Plot the neural network
plot(net.sqrt)

pre = predict(ANN,X_train)
table(pre,Y_train)
