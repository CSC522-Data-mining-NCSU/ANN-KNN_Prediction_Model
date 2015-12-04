#Process test sample data, 100,000 records
movie_raw_info <- read.csv("movie_raw_info.csv")
sample <- read.csv("testSample3.csv")
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

test_index <- index[70001:100000]
X_test <- sample_X[test_index,]
Y_test <- sample_Y[test_index]

write.csv(X_train,"testX_trainE.csv")
write.csv(X_test,"testX_testE.csv")
write.csv(Y_train,"testY_trainE.csv")
write.csv(Y_test,"testY_testE.csv")

write.csv(sample_X,"testSample10E_X.csv",row.names = FALSE)
write.csv(sample_Y,"testSample10E_Y.csv",row.names = FALSE)

