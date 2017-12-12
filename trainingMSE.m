function [weight] = trainingMSE(trainingDatas, trainingLabels)
%%% trainingMSE - trains the trainingDatas with the mean square error
%%% method. The output matrix weight represent one weight for each class.

weight = [];
bl = [];
augData = [trainingDatas; ones(1,size(trainingDatas,2))];
%b = 280x40
for m = 1: size(unique(trainingLabels),2)
   [rows,cols,~] = find(trainingLabels == m);
   b(1:length(trainingLabels)) = -1;
   b(cols) = 1;
   bl = [bl; b];
end
weight = (pinv(augData')) * bl';
end