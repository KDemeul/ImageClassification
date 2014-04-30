function dets = ScanImageOverScale(Cparams, im, min_s, max_s, step_s,th)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

dets = [];
for scale=min_s:step_s:max_s
    im_resized = imresize(im,scale);
    dets_scaled = ScanImageFixedSize(Cparams,im_resized,th);
    dets_rescaled = dets_scaled/scale;
    dets = [dets;dets_rescaled];
end
end

