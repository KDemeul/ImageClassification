function LoadSaveImData(dirname, ni, im_sfn)
%LoadSaveImData Randomly pick ni images in the directory dirname, load
%image and compute its integral store in ii_ims, save the training data in
%the file im_sfn

% Load images
face_fnames = dir(dirname);
aa = 3:length(face_fnames);
a = randperm(length(aa));
fnums = aa(a(1:ni));

[~,ii_im] = LoadIm([[dirname,'/'],face_fnames(fnums(1)).name]);

ii_ims = zeros(ni,size(ii_im,2)*size(ii_im,1));

for i=1:ni
    [~,ii_im] = LoadIm([[dirname,'/'],face_fnames(fnums(i)).name]);
    ii_ims(i,:) = ii_im(:)';
end

save(im_sfn,'dirname','fnums','ii_ims');

end

