function [accuracy]  = calculateAccuracy(lbls, testLabels) 
%%% calculateAccuracy - calculates the accuracy of the predicted label vs
%%% the correct label.

equalValue = find(lbls == testLabels);
accuracy = (length(equalValue)/size(lbls,2))*100;

end