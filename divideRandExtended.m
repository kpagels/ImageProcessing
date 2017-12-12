function [Xtrain, Xtrain_lbls, Xtest, Xtest_lbls] = divideRandExtended(data,labels,trainRatio,valRatio,testRatio)
% divideRandExtended - uses the MATLAB function dividerand that divide data 
% into groups. When they are divided the labels for that specific data set need
% to follow and therefore dividerandSeperate is applied.
% Output is the training set, testing set, training and testing labels
% randomly divided into groups corresponding to the ratio given. 
%
Q = [labels'; data];
[Xtrain,~,Xtest] = dividerand(Q,trainRatio,valRatio,testRatio);
[Xtrain, Xtrain_lbls, Xtest, Xtest_lbls] = dividerandSeperate(Xtrain,Xtest);
end