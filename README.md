# ANN_Prediction_Model
Just use raw data, predict the actual rating of a user give to a specific movie.
The main folder contains the raw data and data preprocessing code, which is written in R.

###readRawData.R
Preprocess the raw data, cluster the movie into 1000 clusters according to its name. The distance between two strings is calculated by Jaro–Winkler distance.

###movie_ground.txt
This file contains the average rating score of each movie.


##ANN_prediction
Build an artificial neural network(ANN) classification model using 100,000 sample data from the raw data. Calculate the RMSE, error rate of the model.

##KNN_prediction
Build an k-nearest neighbors(KNN) classification model using 100,000 sample data from the raw data. Calculate the RMSE, error rate of the model.
