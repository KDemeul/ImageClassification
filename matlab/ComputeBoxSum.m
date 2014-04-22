function A = ComputeBoxSum(ii_im, x, y, w, h)
%ComputeBoxSum computes the sum of the pixel values within a rectanglar area using the integral image.
A = ii_im(y+h-1,x+w-1)+ii_im(y-1,x-1)-ii_im(y-1,x+w-1)-ii_im(y+h-1,x-1);

end

