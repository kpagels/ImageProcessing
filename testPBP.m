function [finishLabel] = testPBP(weight, testingData)
%%% testPBP - calculates the predicted class for a image.
%%% weight - the weight for the testingData set. 
%%% finishLabel - the predicted labels for each image.

augTestData = [testingData; ones(1,size(testingData,2))];
res = weight'*augTestData;
maxer = max(res);
finishLabel = [];
for i=1:size(maxer,2)
    for j=1:size(res(:,i))
        if(res(j,i) == maxer(1,i))
            finishLabel = [finishLabel j];
            break;
        end
    end
end
end