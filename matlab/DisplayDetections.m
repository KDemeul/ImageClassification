function DisplayDetections(im, dets)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

close all
imagesc(im);
hold on
axis equal

for i=1:size(dets,1)
    r = rectangle('Position',dets(i,:));
    set(r,'EdgeColor', 'r');
    
end

end

