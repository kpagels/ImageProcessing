%%%%%%%%%%% MAIN NEAREST CENTROID CLASSIFIER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% In this matlab file there are:
%%% 1) NNC algorithm run with ORL data set.
%%% 2) NNC algorithm run with MNIST data set.
%%% 4 parameters to set for this specific runs:
%%% trainRatio and testRatio all specifies the distribution of
%%% the data set. Where runtime specifies the times to execute the
%%% algorithm
%% %%%%%%%%%%%%%%%%% ORL ORL ORL ORL ORL ORL ORL %%%%%%%%%%%%%%%%%%%%%%%%
clear all; clc;
loaddata
acc = [];
labels = orl_lbls; data = orl_data; 
% change these to change the distribution of the data set.
trainRatio = 0.7; testRatio = 0.3;
runtime = 10; % the runtime
tic

for i = 1:runtime
        [train, trainLabels, test, testLabels] = divideRandExtended(data,labels,trainRatio,0,testRatio);
        % train, test and classify data
        [trainncc, trainnccLabels] = trainingNCC(train,trainLabels);
        lbls = testNCC(trainncc,test,trainnccLabels);

        % calculate the accuracy
        accuracy = calculateAccuracy(lbls,testLabels);
        acc = [acc accuracy];
end
timeelapsed = toc
filename = strcat('NCC_orl_run_',num2str(runtime),'_',num2str(trainRatio*10),'_',num2str(testRatio*10));
save(filename)
%% %%%%%%%%%%%%%%%%%%%% MNIST MNIST MNIST MNIST %%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
loaddata
acc = [];
% change these to change the distribution of the data set.
trainRatio = 0.80; testRatio = 0.10;
% change this to change the runtime
runtime = 1;
tic
for i = 1:runtime
    [train_images, train_labels, test_images, test_labels] = divideRandExtended([train_images test_images],[train_labels; test_labels],trainRatio,0,testRatio);
    test_labels = test_labels';
    % train, test and classify the data
    [trainncc, trainnccLabels] = trainingNCC(train_images,train_labels);
    lbls = testNCC(trainncc,test_images,trainnccLabels);
    % Caclulate accuracy for the classification
    accuracy1 = calculateAccuracy(lbls,test_labels');
    acc = [acc accuracy1];
end
timeelapsed = toc
trainrStr = strrep(num2str(trainRatio),'.','_');
testrStr = strrep(num2str(testRatio),'.','_');
filename = strcat('NCC_mnist_run_',num2str(runtime),'_',trainrStr,'_',testrStr);
save(filename)
