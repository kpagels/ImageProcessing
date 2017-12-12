function loaddataFunc(dummy)
if dummy == 1
Path_ORL_data='ORL\orl_data.mat';
Path_ORL_lbls = 'ORL\orl_lbls.mat';
loadDATA = load(Path_ORL_data);
loadLBLS = load(Path_ORL_lbls);
orl_data = loadDATA.data;
orl_lbls = loadLBLS.lbls;
end
if dummy == 2
[train_images,test_images,train_labels,test_labels] = load_MNIST();
end
end