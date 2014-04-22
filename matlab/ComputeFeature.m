function fs = ComputeFeature(ii_ims, ftype)%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

fs = zeros(1,size(ii_ims,2));
type = ftype(1);
x = ftype(2);
y = ftype(3);
w = ftype(4);
h = ftype(5);

if abs(type-1) < 0.5
    for i=1:size(ii_ims,2)
        fs(i) = FeatureTypeI(ii_ims{i},x,y,w,h);
    end
elseif abs(type-2) < 0.5
    for i=1:size(ii_ims,2)
        fs(i) = FeatureTypeII(ii_ims{i},x,y,w,h);
    end
elseif abs(type-3) < 0.5
    for i=1:size(ii_ims,2)
        fs(i) = FeatureTypeIII(ii_ims{i},x,y,w,h);
    end
    
elseif abs(type-4) < 0.5
    for i=1:size(ii_ims,2)
        fs(i) = FeatureTypeIV(ii_ims{i},x,y,w,h);
    end
end

end

