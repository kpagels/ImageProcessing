

function [train_images,test_images,train_labels,test_labels] = load_MNIST()
PATH_train_images = 'MNIST\train-images.idx3-ubyte'
train_images = loadMNISTImages(PATH_train_images);
test_images = loadMNISTImages('t10k-images.idx3-ubyte');
train_labels = loadMNISTLabels('train-labels.idx1-ubyte');
test_labels = loadMNISTLabels('t10k-labels.idx1-ubyte');
end