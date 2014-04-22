function f = FeatureTypeII( ii_im,x,y,w,h )
%FeatureTypeI Compute F2(x, y, w, h) = B(x, y, w, h) − B(x+w, y, w, h)

f = ComputeBoxSum(ii_im,x+w,y,w,h)-ComputeBoxSum(ii_im,x,y,w,h);


end

