function [Xtrain, Xtrain_label] = trainingNCC(Xdata,Xlbls)
%%% trainingNCC - it finds one mean value for each class.
%%% them all.
%%% Xdata : The dataset
%%% Xlbls : The labels representing the dataset.
%%% Xtrain have the mean values for all the classes. The Xtrain_labels is
%%% representing the labels that correspond to Xtrain.

uniquelabels = unique(Xlbls)';
Xtrain = zeros(size(Xdata,1),size(uniquelabels,2));
k = 0;
for i = uniquelabels
    k = k + 1;
    [rows,cols,vals] = find(Xlbls == i);

    Xtrain(:,k) = mean(Xdata(:,rows),2); % column vector containing the mean of each row
    Xtrain_label(k) = mean(Xlbls(rows),1);
    
end

end