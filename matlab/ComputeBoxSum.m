function A = ComputeBoxSum(ii_im, x, y, w, h)
%ComputeBoxSum computes the sum of the pixel values within a rectanglar area using the integral image.
A = 0;
if(x==1 && y==1)
    A = ii_im(y+h-1,x+w-1);
else
    if(x==1)
        A = ii_im(y+h-1,x+w-1)-ii_im(y-1,x+w-1);
    else
        if(y==1)
            A = ii_im(y+h-1,x+w-1)-ii_im(y+h-1,x-1);
        else
            A = ii_im(y+h-1,x+w-1)+ii_im(y-1,x-1)-ii_im(y-1,x+w-1)-ii_im(y+h-1,x-1);
        end
    end
end

end

