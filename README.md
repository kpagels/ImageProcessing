# ImageProcessing
This git hub folder includes code for 5 different classifiers and scripts for plotting. The MNIST and ORL data are used.

The main files:
* main_nearestClassifier.m
* main_nearestNeighbor.m
* main_nearestsubClassifier.m
* main_Perceptron_batch.m
* main_Perceptron_MSE.m

Helper functions
* calculateAccuracy.m
* divideRandExtended.m
* dividerandSeperate.m

The files for loading the MNIST and ORL data sets.
* load_MNIST.m
* loaddata.m
* loaddataFunc.m
* loadMNISTImages.m
* loadMNISTLabels.m
* orl_data.mat
* orl_lbls.mat

### Nearest Centroid Classifier
The main file for the nearest centroid classifier are
```
main_nearestClassifier.m
```
Which has the following files for training and testing:
* trainingNCC.m / trainingNCC2.m - training the data set.
* testNCC.m - testing the data set.

### Nearest Neighbor Classifier
The main file for the nearest neighbor classifier are
```
main_nearestNeighbor.m
```
Which has the following file for testing:
* testNCC.m
        
### Nearest Sub-class Classifier
The main file for the nearest sub-class classifier are
```
main_nearestsubClassifier.m
```
Which has the following file for training:
* trainingNSC.m
        
### Perceptron trained using Backpropagation 
The main file for the perceptron trained using Backpropagation are
```
main_Perceptron_batch.m
```
Which has the follwoing files for training and testing:
* trainingPBP.m
* testPBP.m
        
### Perceptron using Mean Square Error
The main file for the perceptron using mean square error are:
```
main_Perceptron_MSE.m
```
Which has the follwoing file for training:
* trainingMSE.m





