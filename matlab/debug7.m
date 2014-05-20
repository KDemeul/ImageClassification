close all
clear all
clc

profile on

eps = 1e-6;

Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');
dinfo7 = load('DebugInfo/debuginfo7.mat');

T = dinfo7.T;
debug = 0;
% load('Cparams.mat')
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T, debug);
sum(abs(dinfo7.alphas - Cparams.alphas)>eps)
sum(abs(dinfo7.Thetas(:) - Cparams.Thetas(:))>eps)

profile viewer