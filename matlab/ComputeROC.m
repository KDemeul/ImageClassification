function ComputeROC(Cparams, Fdata, NFdata)
%%%%%%%%%%%%% GETTING TEST IMAGES %%%%%%%%%%%%%
% Find the indice of the not-used images
dirfaces = 'TrainingImages/FACES';
dirnonfaces = 'TrainingImages/NFACES';
face_fnames = dir(dirfaces);
nonface_fnames = dir(dirnonfaces);

Num_im_F = size(face_fnames,1);
Num_im_NF = size(nonface_fnames,1);
Set_indice_F = setdiff(3:1:Num_im_F, Fdata.fnums);
Set_indice_NF = setdiff(3:1:Num_im_NF, NFdata.fnums);

% Set the number of image used for the test
Num_test_F  = size(Set_indice_F,2);
Num_test_NF = size(Set_indice_NF,2);

% Load images
Set_test_F  = zeros(size(Fdata.ii_ims,2),Num_test_F);
Set_test_NF = zeros(size(NFdata.ii_ims,2),Num_test_NF);

for i=1:Num_test_F
    [~,ii_im] = LoadIm([[dirfaces,'/'],face_fnames(Set_indice_F(i)).name]);
    Set_test_F(:,i) = ii_im(:);
end
for i=1:Num_test_NF
    [~,ii_im] = LoadIm([[dirnonfaces,'/'],nonface_fnames(Set_indice_NF(i)).name]);
    Set_test_NF(:,i) = ii_im(:);
end

th_set = min(Cparams.alphas):0.1:sum(Cparams.alphas);
ROC = zeros(size(th_set,2),2);

for th_ind = 1:size(th_set,2)
    th = th_set(th_ind);
    %%%%%%%%%%%%% APPLY DETECTOR %%%%%%%%%%%%%
    tp = 0;
    for i = 1:Num_test_F
        tp = tp + (ApplyDetector(Cparams,Set_test_F(:,i)) > th);
    end
    fn = Num_test_F - tp;
    
    fp = 0;
    for i = 1:Num_test_NF
        fp = fp + (ApplyDetector(Cparams,Set_test_NF(:,i)) > th);
    end
    tn = Num_test_NF - fp;
    
    %%%%%%%%%%%%% COMPUTE tpr AND fpr %%%%%%%%%%%%%
    tpr = tp/(tp + fn);
    fpr = fp/(tn + fp);
    ROC(th_ind,:) = [fpr,tpr];
end

%%%%%%%%%%%%% DISPLAY ROC %%%%%%%%%%%%%
figure,
axis equal
plot(ROC(:,1),ROC(:,2));

%%%%%%%%%%%%% FIND THRESHOLD %%%%%%%%%%%%%
tpr_goal = 0.7;
[~, ind] = min(abs(ROC(:,2)-tpr_goal));
threshold = th_set(ind)

end




