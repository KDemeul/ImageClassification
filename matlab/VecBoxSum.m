function b_vec = VecBoxSum(x, y, w, h, W, H)
%VecBoxSum ii_im(:)’*b_vec equals ComputeBoxSum(ii_im, x, y, w, h)
% With ComputeBoxSum(ii_im, x, y, w, h) =
%      ii_im(y+h-1,x+w-1)+ii_im(y-1,x-1)-ii_im(y-1,x+w-1)-ii_im(y+h-1,x-1);

b=zeros(H,W);

if(x==1 && y==1)
    b(y+h-1,x+w-1) = 1;
else
    if(x==1)
        b(y+h-1,x+w-1) = 1;
        b(y-1,x+w-1) = -1;
    else
        if(y==1)
            b(y+h-1,x+w-1)=1;
            b(y+h-1,x-1)=-1;
        else
            b(y+h-1,x+w-1)=1;
            b(y-1,x-1)=1;
            b(y-1,x+w-1)=-1;
            b(y+h-1,x-1)=-1;
        end
    end
end

b_vec = b(:);
end
