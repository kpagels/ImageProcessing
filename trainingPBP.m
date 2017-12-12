function [weight] = trainingPBP(augData,tlbls,eta)
%%% trainingPBP - finds the best optimal weight for each class by using the
%%% Batch Perceptron Algorithm.
%%% NOTE: This algorithm is really slow and should for further use be
%%% optimized and propably add an condition where it checks if Z is empty
%%% instead of only going for 1000 itearations.
%%%   augData: is augmented data [data; ones]
%%%   tlbls: is the labels for that specific data set.
%%%   eta: is the learning rate.

augData(end:end+1,:) = 1;
binarylbls = zeros(1,length(tlbls));
weight = zeros(size(augData,1),size(unique(tlbls),1));
for m = 1:length(unique(tlbls))
    [rows,~,~] = find(tlbls == m);
    binarylbls(1:length(tlbls)) = -1;
    binarylbls(rows) = 1;
    % This condition should be optimize instead of only running 1000 it.
    for t = 1:1000
       Z = [];
       Zlbls = [];
       [augData, tlbls, ~, ~] = divideRandExtended(augData,tlbls,1,0,0);
       for i = 1: size(augData,2) %run through all data in set.
           % to shufle the data to give it a different order
           
           img = augData(:,i);
           w = weight(:,m);
           f = binarylbls(i) * transpose(w) * img;
           if f < 0
               Z =[Z img];
               Zlbls = [Zlbls binarylbls(i)];
           end
       end
       if(size(Z,1) > 0 && size(Zlbls,1) > 0)
           weight(:,m) = weight(:,m) + (Zlbls * Z')' * eta;
       else
           weight(:,m) = weight(:,m) + eta;
       end
    end
end
end