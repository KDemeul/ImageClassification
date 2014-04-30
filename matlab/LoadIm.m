function [im, ii_im] = LoadIm(im_fname)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

im = imread(im_fname);
im = im2double(im);

im_vec = im(:);

mu = mean(im_vec);
sigma = std(im_vec);

if sigma == 0
    im = (im-mu);
else
    im = (im-mu)./sigma;
end

ii_im = cumsum(cumsum(im,2),1);

end

