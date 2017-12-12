function [classMeans, classMeansLabels] = trainingNCC2(trainingDatas, trainingLabels, k)
%%% trainingNCC2 - does the same as trainingNCC but with minor fix. 
%%% FIX: K-means gave errors with some K´s, its fixed now.
%%%
UniqueLabels = unique(trainingLabels)';
classMeans = [];
classMeansLabels = [];

for label = UniqueLabels
   [rows,cols,vals] = find(trainingLabels == label);
   if size(rows,1) < k
       rowsize = size(rows,1);
       for  i = 0: k - rowsize
           trainingDatas = [trainingDatas mean(trainingDatas(:,rows),2)];
           trainingLabels = [trainingLabels; cols(1,1)];
           rows = [rows; size(trainingLabels,1)];
       end
   end
   temp = trainingDatas(:,rows);
   [~, c] = kmeans(temp',k);
   c = c';
   classMeans = [classMeans c];
   classMeansLabels = [classMeansLabels repmat(label,1,k)];
end
end