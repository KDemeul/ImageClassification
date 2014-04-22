clear all
close all

% addpath('TestImages')
% addpath('DebugInfo')
% addpath('TrainingImages')
% addpath('TrainingImages/FACES')
% addpath('TrainingImages/NFACES')

%% DEBUG POINTS

% DEBUG POINT 1
[ii,ii_im] = LoadIm('TrainingImages/FACES/face00001.bmp');

dinfo1 = load('DebugInfo/debuginfo1.mat');
eps = 1e-6;
s1 = sum(abs(dinfo1.im(:)-im(:)) > eps);
s2 = sum(abs(dinfo1.ii_im(:)-ii_im(:)) > eps);

if (s1 == 0 && s2 ==0)
    disp('Debug point 1 correct')
end

% DEBUG POINT 2

dinfo2 = load('DebugInfo/debuginfo2.mat');
x = dinfo2.x; y = dinfo2.y; w = dinfo2.w; h = dinfo2.h;
abs(dinfo2.f1 - FeatureTypeI(ii_im, x, y, w, h)) > eps
abs(dinfo2.f2 - FeatureTypeII(ii_im, x, y, w, h)) > eps
abs(dinfo2.f3 - FeatureTypeIII(ii_im, x, y, w, h)) > eps
abs(dinfo2.f4 - FeatureTypeIV(ii_im, x, y, w, h)) > eps

