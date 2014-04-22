function f = FeatureTypeIV( ii_im,x,y,w,h )
%FeatureTypeI Compute F4(x, y, w, h) 
% F4 = B(x, y, w, h) − B(x, y + h, w, h) + B(x+w, y+h, w, h) − B(x+w, y +
% h, w, h)


f = ComputeBoxSum(ii_im,x,y+h,w,h)-ComputeBoxSum(ii_im,x,y,w,h)+ComputeBoxSum(ii_im,x+w,y,w,h)-ComputeBoxSum(ii_im,x+w,y+h,w,h);



end

