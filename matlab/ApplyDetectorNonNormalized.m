function sc = ApplyDetectorNonNormalized(Cparams, ii_im, ii_im_2, x, y, L)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

p = Cparams.Thetas(:,3);
alphas = Cparams.alphas;
thetas = Cparams.Thetas(:,2);

ii_im_window = ii_im(y:y+L-1,x:x+L-1);

% Features evaluation
ftypes = Cparams.Thetas(:,1);
fmat = Cparams.fmat(:,ftypes);
f = fmat'*ii_im_window(:);

% Feature normalization
features = Cparams.all_ftypes(ftypes,1);

mu = ComputeBoxSum(ii_im,x,y,L,L)/L^2;
sigma = sqrt((ComputeBoxSum(ii_im_2,x,y,L,L)-(L*mu)^2)/(L^2-1));
for i=1:size(features)
    f(i) = f(i)/sigma;
    if features(i) == 3
        f(i) = f(i) - L^2*mu/sigma;
    end
end

sc = sum(alphas.*((p.*f)<(p.*thetas)));

end

