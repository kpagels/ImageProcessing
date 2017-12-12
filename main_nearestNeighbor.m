%%%%%%%%%%% MAIN NEAREST NEIGHBOR CLASSIFIER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% In this matlab file there are:
%%% 1) NSCC algorithm run with ORL data set. 
%%% 2) NSCC algorithm run with MNIST data set. - time comsuming
%%% MAIN NEAREST NEIGHBOR CLASSIFIER
%% %%%%%%%%%%%%%%%%% ORL ORL ORL ORL ORL ORL ORL %%%%%%%%%%%%%%%%%%%%%%%%
clear all
loaddata

%%%%%%%%%%%%%%% START DIVIDERAND %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% SEPERATE TRAIN AND TESTING SET IN PROCENT
labels = orl_lbls;
data = orl_data; trainRatio = 0.7; valRatio = 0; testRatio = 0.3;
[train, trainLabels, test, testLabels] = divideRandExtended(data,labels,trainRatio,valRatio,testRatio);
%%%%%%%%%%%%%%% END DIVIDERAND %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
acc = []
runtime = 1;
tic
for i = 1:runtime
    lbls = testNCC(train,test,trainLabels');
    accuracy = calculateAccuracy(testLabels,lbls);
    acc = [acc accuracy];
end

timelapsed = toc;
filename = strcat('NNC_orl_run_',num2str(runtime));
save(filename)

%% %%%%%%%%%%%%%%%%%% MNIST MNIST MNIST %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
loaddata
acc = [];
runtime = 1;
tic
for i = 1:runtime
    lbls = testNCC(train_images,test_images,train_labels');
    accuracy = calculateAccuracy(test_labels',lbls);
    acc = [acc accuracy];
end
timeelapsed = toc;
filename = strcat('NNC_mnist_run_',num2str(runtime));
save(filename)