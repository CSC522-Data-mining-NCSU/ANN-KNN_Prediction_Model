
% This script assumes these variables are defined:
%
%   X_train - input data.
%   Y_train - target data.

load('data.mat')
mdl = fitcknn(Xtrain,Ytrain);
yPreTrain = predict(mdl,Xtrain);
%Error rate
error_rate_train = 1 - sum(yPreTrain == Ytrain)/length(Ytrain);



%RMSE for training data
rmse_train = (yPreTrain-Ytrain);
rmse_train = rmse_train.*rmse_train;
rmse_train = sum(rmse_train)/length(rmse_train);
rmse_train = sqrt(rmse_train);


%RMSE for testing data
yPredict = predict(mdl,Xtest);


%Error rate
error_rate_test = 1 - sum(yPredict == Ytest)/length(Ytest);


rmse_test = (yPredict-Ytest);
rmse_test = rmse_test.*rmse_test;
rmse_test = sum(rmse_test)/length(rmse_test);
rmse_test = sqrt(rmse_test);
