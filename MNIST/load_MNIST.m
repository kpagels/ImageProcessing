

function [train_images,test_images,train_labels,test_labels] = load_MNIST()
PATH_train_images = 'MNIST\train-images.idx3-ubyte';
PATH_test_images = 'MNIST\t10k-images.idx3-ubyte';
PATH_train_labels = 'MNIST\train-labels.idx1-ubyte';
PATH_test_labels = 'MNIST\t10k-labels.idx1-ubyte';
train_images = loadMNISTImages(PATH_train_images);
test_images = loadMNISTImages(PATH_test_images);
train_labels = loadMNISTLabels(PATH_train_labels);
test_labels = loadMNISTLabels(PATH_test_labels);
end