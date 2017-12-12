function [Xplot, Xlblsplot, Xtrainsc, Xtrain_labelsc] = trainingNSC(Xdata,Xlbls,K)
%%% trainingNSC - divide the classes into K subclasses and returns the
%%% training set and label for that specific set.
%%% Furthermore it returns Xplot and Xlblsplot which is only used to make
%%% it possible to illustrate the classes in a gscatter plot.
%%% Xdata : The data set (usually training set)
%%% Xlbls : The labels corresponding to Xdata
%%% K : how many subclasses the classes must have.

uniquelabels = unique(Xlbls)';
Xtrainsc = [];
Xtrain_labelsc = [];
Xlblsplot = [];

for i = uniquelabels
    [rows,~,~] = find(Xlbls == i);
    [~,C] = kmeans(Xdata(:,rows)',K); % column vector containing the mean of each row
    Xtrainsc = [Xtrainsc C'];%(:,k:k+K-1) = C'
    Xtrain_labelsc = [Xtrain_labelsc repmat(i,1,K)];%(k:k+K-1) = i;
    Xplot = Xtrainsc;%(:,k:k+K-1) = C'
    Xlblsplot = [Xlblsplot i*10:i*10+K-1];%(k:k+K-1) = i;    
     
end

end