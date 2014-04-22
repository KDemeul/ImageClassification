clear all
close all

% addpath('TestImages')
% addpath('DebugInfo')
% addpath('TrainingImages')
% addpath('TrainingImages/FACES')
% addpath('TrainingImages/NFACES')


%% DEBUG POINTS

% DEBUG POINT 1
[im,ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');

dinfo1 = load('DebugInfo/debuginfo1.mat');
eps = 1e-6;
s1 = sum(abs(dinfo1.im(:)-im(:)) > eps);
s2 = sum(abs(dinfo1.ii_im(:)-ii_im(:)) > eps);

if (s1 == 0 && s2 ==0)
    disp('Debug point 1 correct');
end

% DEBUG POINT 2

dinfo2 = load('DebugInfo/debuginfo2.mat');
x = dinfo2.x; y = dinfo2.y; w = dinfo2.w; h = dinfo2.h;
s1 = abs(dinfo2.f1 - FeatureTypeI(ii_im, x, y, w, h)) > eps;
s2 = abs(dinfo2.f2 - FeatureTypeII(ii_im, x, y, w, h)) > eps;
s3 = abs(dinfo2.f3 - FeatureTypeIII(ii_im, x, y, w, h)) > eps;
s4 = abs(dinfo2.f4 - FeatureTypeIV(ii_im, x, y, w, h)) > eps;

if(s1 == 0 && s2 == 0 && s3 == 0 && s4 == 0)
    disp('Debug point 2 correct');
end

% DEBUG POINT 3

dirname = 'TrainingImages/FACES/';
dinfo4 = load('DebugInfo/debuginfo4.mat');
ni = dinfo4.ni;
all_ftypes = dinfo4.all_ftypes;
im_sfn = 'FaceData.mat';
f_sfn = 'FeaturesToMat.mat';
rng(dinfo4.jseed);
LoadSaveImData(dirname,ni,im_sfn);
ComputeSaveFData(all_ftypes,f_sfn);
load(im_sfn);
load(f_sfn);
s1 = max(max(abs(dinfo4.fmat - fmat))) > eps;
s2 = max(max(abs(dinfo4.ii_ims - ii_ims))) > eps;

if(s1==0 && s2==0)
    disp('Debug point 4 correct')
end