function Cparams = BoostingAlg(Fdata, NFdata, FTdata, T)
Nf = size(Fdata.ii_ims,1);
Nnf = size(NFdata.ii_ims,1);
% Nfeat = size(FTdata.all_ftypes,1);
Nfeat = 1000;

%%%%%%%%%%%% INITIALIZATION %%%%%%%%%%%%
ys = [ones(Nf,1);zeros(Nnf,1)];
ws = [1/(2*Nf)*ones(Nf11);
    1/(2*Nnf)*ones(Nnf,1)];
err_min = 1e100;
fs_min = 0;
theta_min = 0;
p_min = 0;
j_min = 0;

Cparams.alphas = zeros(T,1);
Cparams.Thetas = zeros(T,3);
Cparams.fmat = FTdata.fmat;
Cparams.all_ftypes = FTdata.all_ftypes;


%%%%%%%%%%%% LOOP %%%%%%%%%%%%
for t = 1:T
    % WEIGHT NORMALIZATION
    ws = ws/sum(ws);
    
    % TRAINING OF THE DIFFERENT WEAK CLASSIFIERS
    for j = 1:Nfeat
        fs = [Fdata.ii_ims; NFdata.ii_ims] * FTdata.fmat(:,j);
        [theta, p, err] = LearnWeakClassifier(ws, fs, ys);
        % FINDING THE LOWEST ERROR TRAINED CLASSIFIERS
        if err < err_min
            err_min = err;
            fs_min = fs;
            theta_min = theta;
            p_min = p;
            j_min = j;
        end
    end
    
    % UPDATE WEIGHT
    beta = err_min/(1-err_min);
    coef = beta^(1-abs(double(p_min*fs_min < p_min*theta_min)-ys));
    ws = ws.*coef;
    
    % UPDATE Cparams
    Cparams.alphas(t) = - log(beta);
    Cparams.Thetas(t,:) = [j_min, p_min, theta_min];
end

end

