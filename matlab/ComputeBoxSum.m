function A = ComputeBoxSum(ii_im, x, y, w, h)
%ComputeBoxSum computes the sum of the pixel values within a rectangular area using the integral image.

new_ii = ii_im(y:y+h-1,x:x+w-1);
A = sum(sum(new_ii,2),1);

end

