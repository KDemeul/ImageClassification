function dets = ScanImageFixedSize(Cparams, im, th)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

L = 19;
dets = [];

if size(im,3) == 3
    im = rgb2gray(im);
end

im_square = im.*im;
ii_im = cumsum(cumsum(im,2),1);
ii_im_2 = cumsum(cumsum(im_square,2),1);

for x=1:size(im,2)-L+1
    for y=1:size(im,1)-L+1
        sc = ApplyDetectorNonNormalized(Cparams,ii_im,ii_im_2,x,y,L);
        if sc > th
            dets = [dets; [x,y,L,L]];
        end
    end
end

end

