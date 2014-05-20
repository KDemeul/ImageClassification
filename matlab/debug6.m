close all
clear all
clc

profile on

eps = 1e-6;

Fdata = load('FaceData.mat');
NFdata = load('NonFaceData.mat');
FTdata = load('FeaturesToUse.mat');

dinfo6 = load('DebugInfo/debuginfo6.mat');
T = dinfo6.T;
debug = 1;
Cparams = BoostingAlg(Fdata, NFdata, FTdata, T, debug);
sum(abs(dinfo6.alphas - Cparams.alphas)>eps)
sum(abs(dinfo6.Thetas(:) - Cparams.Thetas(:))>eps)

profile viewer