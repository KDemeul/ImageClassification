function ftype_vec = VecFeature(ftype, W, H)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

x = ftype(2);
y = ftype(3);
w = ftype(4);
h = ftype(5);

ftype_vec = VecBoxSum(x,y,w,h,W,H) - VecBoxSum(x,y+h,w,h,W,H);

end

