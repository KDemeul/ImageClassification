close all
clear all
clc

eps = 1e-6;

for i=1:9
    [ims{i},ii_ims{i}] = LoadIm(['TrainingImages/FACES/face0000',int2str(i),'.bmp']);
end
for i=10:99
    [ims{i},ii_ims{i}] = LoadIm(['TrainingImages/FACES/face000',int2str(i),'.bmp']);
end
[ims{100},ii_ims{100}] = LoadIm(['TrainingImages/FACES/face00100.bmp']);

for i=1:100
    ims1(i,:) = ims{i}(:);
end
all_ftypes = EnumAllFeatures(19,19);

dinfo3 = load('DebugInfo/debuginfo3.mat');

ftype = dinfo3.ftype;
sum(abs(dinfo3.fs - ComputeFeature(ii_ims, ftype)) > eps)
fmat = VecAllFeatures(all_ftypes,19,19);
fs1 = VecComputeFeature(ims1,fmat(:,1));
fs2 = ComputeFeature(ims,all_ftypes(1,:));