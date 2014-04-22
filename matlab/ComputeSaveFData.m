function ComputeSaveFData(all_ftypes, f_sfn)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here

W = 19;
H = 19;

fmat = VecAllFeatures(all_ftypes,W,H);

save(f_sfn, 'fmat', 'all_ftypes', 'W', 'H');

end

