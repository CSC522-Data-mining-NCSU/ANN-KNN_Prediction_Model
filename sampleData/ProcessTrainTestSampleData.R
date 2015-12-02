#Process both train and test data, 100,000 records
user_avg_rating <- read.csv("user_avg.csv")
movie_raw_info <- read.csv("movie_raw_info.csv")
testSample <- read.csv("testSample.csv")
testSample_Y <- testSample$rating
testSample$movie_year <- movie_raw_info$year[testSample$movie_id]
testSample$movie_cluster <- movie_raw_info$cluster[testSample$movie_id]
testSample$movie_avgScore <- movie_raw_info$avgScore[testSample$movie_id]
testSample_X <- testSample
testSample_X$movie_id <- NULL
testSample_X$user_id <- NULL
testSample_X$rating <- NULL
testSample_X$id <- NULL

write.csv(testSample_X,"testSample_X.csv",row.names = FALSE)
write.csv(testSample_Y,"testSample_Y.csv",row.names = FALSE)

trainSample <- read.csv("trainSample.csv")
trainSample_Y <- trainSample$rating
trainSample$movie_year <- movie_raw_info$year[trainSample$movie_id]
trainSample$movie_cluster <- movie_raw_info$cluster[trainSample$movie_id]
trainSample$movie_avgScore <- movie_raw_info$avgScore[trainSample$movie_id]
trainSample_X <- trainSample
trainSample_X$movie_id <- NULL
trainSample_X$user_id <- NULL
trainSample_X$rating <- NULL
trainSample_X$id <- NULL

write.csv(trainSample_X,"trainSample_X.csv",row.names = FALSE)
write.csv(trainSample_Y,"trainSample_Y.csv",row.names = FALSE)