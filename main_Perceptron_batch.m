%%%%%%%%%%%%%%%%%% MAIN BATCH PERCEPTRON %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% In this matlab file there are:
%%% 1) PBP algorithm run with ORL data set. - fast
%%% 2) PBP algorithm run with MNIST data set. - time exhaustive
%%% eta is the learning rate parameter.
%%% runtime is the running time
%%% trainRatio and testRatio is the distribution of the samples
%% %%%%%%%%%%%%%%%%% ORL ORL ORL ORL ORL ORL ORL %%%%%%%%%%%%%%%%%%%%%%%%

clear all 
loaddata
ac = [];
labels = orl_lbls; data = orl_data; 

% change these to change the distribution of the data
trainRatio = 0.7; testRatio = 0.3;
% Eta is the learning rate parameter in the algorithm
eta  = 0.05;
% runtime specifies the runtime
runtime = 10;
tic
for i = 1:runtime
    [train, trainLabels, test, testLabels] = divideRandExtended(data,labels,trainRatio,0,testRatio);
    [W] = trainingPBP(train,trainLabels,eta);
    resultLabels = testPBP(W, test);
    accuracy = calculateAccuracy(testLabels,resultLabels)
    ac = [ac accuracy];
end
toc
etaSTR = strrep(num2str(eta),'.','_');
filename = strcat('PBP_orl_',etaSTR);
save(filename)

%% %%%%%%%%%%%%%%%%%%%% MNIST MNIST MNIST MNIST %%%%%%%%%%%%%%%%%%%%%%%%%%
clear all 
loaddata

[train_images, train_labels, ~, ~] = divideRandExtended(train_images,train_labels,1,0,0);
[test_images, test_labels, ~, ~] = divideRandExtended(test_images,test_labels,1,0,0);

ac = [];
% Eta is the learning rate parameter in the algorithm
eta  = 0.1;
runtime = 2;
for i = 1:runtime
    % to randomly shuffle the data
    [train_images, train_labels, ~, ~] = divideRandExtended(train_images,train_labels,1,0,0);
    [test_images, test_labels, ~, ~] = divideRandExtended(test_images,test_labels,1,0,0);
    W = trainingPBP(train_images,train_labels,eta);
    resultLabels = testPBP(W, test_images);
    accuracy = calculateAccuracy(test_labels',resultLabels)
    ac = [ac accuracy];
end
etaSTR = strrep(num2str(eta),'.','_');
filename = strcat('PBP_mnist_run_',num2str(runtime),'_',etaSTR);
save(filename)