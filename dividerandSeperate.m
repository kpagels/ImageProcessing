function [Xtrain, Xtrain_lbls, Xtest, Xtest_lbls] = dividerandSeperate(Xtrain,Xtest)
%%% dividerandSeperate - seperates the data and labels
%%% Xtrain and Xtest are matrixs that contain [label; data]. 
%%%
Xtrain_lbls = Xtrain(1,:)'; 
Xtest_lbls = Xtest(1,:);
Xtest = Xtest(2:size(Xtest,1),:);
Xtrain = Xtrain(2:size(Xtrain,1),:);

end