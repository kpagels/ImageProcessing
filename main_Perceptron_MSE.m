%%%%%%%%%%%%%%%%%% MAIN PERCEPTRON USING MSE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% In this matlab file there are:
%%% 1) PMSE algorithm run with ORL data set.
%%% 2) PMSE algorithm run with MNIST data set.

%% %%%%%%%%%%%%%%%%% ORL ORL ORL ORL ORL ORL ORL %%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
loaddata
acc = [];
labels = orl_lbls; data = orl_data; 
% change these to change the distribution of the data set.
trainRatio = 0.7; testRatio = 0.3;
% change this to change the runtime.
runtime = 2;
tic
for i = 1:runtime
    [train, trainLabels, test, testLabels] = divideRandExtended(data,labels,trainRatio,0,testRatio);
    [w] = trainingMSE(train, trainLabels');
    [finishLabel] = testPBP(w, test);
    accuracy  = calculateAccuracy(testLabels,finishLabel); 
    acc = [acc accuracy];
end
filename = strcat('PMSE_orl_run_',num2str(runtime));
save(filename)

%% %%%%%%%%%%%%%%%%%%%% MNIST MNIST MNIST MNIST %%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
loaddata
acc = [];
% change these to change the distribution of the data
trainRatio = 0.7; testRatio = 0.3;

runtime = 1;
for i = 1:runtime
    [train_images, train_labels, ~, ~] = divideRandExtended(train_images,train_labels,1,0,0);
    [test_images, test_labels, ~, ~] = divideRandExtended(test_images,test_labels,1,0,0);

    w = trainingMSE(train_images, train_labels'+1);
    finishLabel = testPBP(w, test_images);
    accuracy  = calculateAccuracy(test_labels',finishLabel-1); 
    acc = [acc accuracy];
end

filename = strcat('PMSE_mnist_run_',num2str(runtime));
save(filename)