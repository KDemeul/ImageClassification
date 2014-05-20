close all
clear all
clc

profile on

dinfo5 = load('DebugInfo/debuginfo5.mat');
rng(dinfo5.jseed);
np = dinfo5.np;
nn = dinfo5.nn;
all_ftypes = dinfo5.all_ftypes;
GetTrainingData(all_ftypes, np, nn);

load('FaceData.mat')
dinfo5.ffnums - fnums

profile viewer