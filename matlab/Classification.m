clear all;
close all;
clc;

profile on
load('Cparams.mat')
im_fname = 'facepic1.jpg';%'one_chris.png';
im = LoadIm(im_fname);
imref = imread(im_fname);

%dets = ScanImageFixedSize(Cparams,im,25.5);

minscale = 19/min(size(im(:,:,1)));
minscale = 0.3
maxscale = 0.5;

dets = ScanImageOverScale(Cparams,im,minscale,maxscale,0.2,28.2);
dets = PruneDetections(dets);
DisplayDetections(imref,dets);

% T = 100 => th = 25.5 (FD:2000 NFD:4000)
% T = 10 => ?
profile viewer