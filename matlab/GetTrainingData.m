function GetTrainingData(all_ftypes, np, nn)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

LoadSaveImData('TrainingImages\FACES',np,'FaceData.mat');
LoadSaveImData('TrainingImages\NFACES',nn,'NonFaceData.mat');
ComputeSaveFData(all_ftypes,'FeaturesToUse.mat');

end

