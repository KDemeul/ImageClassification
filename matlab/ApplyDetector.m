function sc = ApplyDetector(Cparams, ii_im)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

p = Cparams.Thetas(:,3);
alphas = Cparams.alphas;
fmat = Cparams.fmat(:,Cparams.Thetas(:,1));
f = fmat'*ii_im;
thetas = Cparams.Thetas(:,2);

sc = sum(alphas.*((p.*f)<(p.*thetas)));

end

