function cpic = MakeClassifierPic(all_ftypes, chosen_f, alphas, ps, W, H)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

cpic = zeros(H,W);
fpic = zeros(H,W,size(chosen_f,1));
for i=1:size(chosen_f,2)
    fpic(:,:,i) = MakeFeaturePic(all_ftypes(chosen_f(i),:),W,H);
end
for i=1:size(alphas,2)
    cpic = cpic + alphas(i)*ps(i)*fpic(:,:,i);
end

end

