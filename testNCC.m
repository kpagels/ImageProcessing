function lbls = testNCC(Xtrain,Xtest,train_lbls)
%%% testNCC - calculates the closest distance from the training set to the
%%% testing set.
%%% Xtrain is the testing data set. Xtest is the testing data set.
%%% train_lbls is the training labels.
%%% lbls is the predicted labels for the testing data set.

preSmallDist(1:size(Xtest,2)) = 100;

lbls = zeros(1,size(Xtest,2));
for k = 1:size(Xtest,2)
    x = Xtest(:,k);
    for i = 1:size(Xtrain,2)

        my = Xtrain(:,i);
        smallDist = norm(x-my)^2;
        if(smallDist < preSmallDist(k))
            preSmallDist(k) = smallDist;
            lbls(k) = train_lbls(:,i);
        end
    
    end
end
end