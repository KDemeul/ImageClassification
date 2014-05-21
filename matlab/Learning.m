clear all;
close all;
clc;

Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');
T = 100;

%%%%%%%%%%% LEARNING BY BOOSTING ALGORITHM %%%%%%%%%%%%%%%
profile on
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T,0);
save('Cparams', 'Cparams');
profile viewer