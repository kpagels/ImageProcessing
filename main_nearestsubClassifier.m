%%%%%%%%%%% MAIN NEAREST SUB CLASS CLASSIFIER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% In this matlab file there are:
%%% 1) NSCC algorithm run with ORL data set.
%%% 2) NSCC algorithm run with MNIST data set.
%%%                      K =    2 86.15%
%%%    (extreme example) K = 1000 97.50% accuracy

%% %%%%%%%%%%%%%%%%%% ORL ORL ORL %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
loaddata
acc = [];

labels = orl_lbls;
data = orl_data; trainRatio = 0.7; valRatio = 0; testRatio = 0.3;
[train, trainLabels, test, testLabels] = divideRandExtended(data,labels,trainRatio,valRatio,testRatio);

runtime = 2; % runtime
% if it fails with some K´s consider using traningNSC2 instead.
K = 2; %Number of subclasses
tic
for i = 1:runtime
    [Xplot, Xlblsplot, trainsc, trainscLabels] = trainingNSC(train,trainLabels,K);
    % CALCULATE THE LABELS FOR THE CLASSIFICATION
    lbls = testNCC(trainsc,test,trainscLabels);
    % CALCULATE ACCURACY FOR THE CLASSIFICATION
    accuracy  = calculateAccuracy(lbls, testLabels);
    acc = [acc accuracy];
end
timelapsed = toc;
filename = strcat('NSCC_orl_run_',num2str(runtime),'_K_',num2str(K));
save(filename)

%% %%%%%%%%%%%%%%%%%% MNIST MNIST MNIST %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
loaddata
acc = [];

% if it fails with some K´s consider using traningNSC2 instead.
K = 2; % number of k-means 
runtime = 2; %runtime

% Training, testing and classifying
tic
for i = 1:runtime
    [T_plot, Tlabel_plot, Xtrain1, Xtrain_label1] = trainingNSC(train_images,train_labels,K);
    lbls_digit = testNCC(Xtrain1,test_images,Xtrain_label1);
    lbls_digit_plot = testNCC(T_plot,test_images,Tlabel_plot);

    % Calculate accuracy for the classification
    accuracy1 = calculateAccuracy(lbls_digit,test_labels');
    acc = [acc accuracy1];
end
timelapsed = toc;
filename = strcat('NSCC_mnist_run_',num2str(runtime),'_K_',num2str(K));
save(filename)