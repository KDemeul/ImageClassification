function fmat = VecAllFeatures(all_ftypes, W, H)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

all_size = size(all_ftypes);
fmat = zeros(W*H,all_size);

for i=1:all_size
    fmat(:,i) = VecFeature(all_ftypes(i),W,H);
end

end

