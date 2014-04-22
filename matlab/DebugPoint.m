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

