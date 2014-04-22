function all_ftypes = EnumAllFeatures(W, H)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

all_ftypes_temp = zeros(2^19,5);
i = 1;

for x=1:W
    for y=1:H
        %type 1
        for w=1:W-x+1
           for h=1:(H-y+1)/2
               all_ftypes_temp(i,:) = [1,x,y,w,h];
               i=i+1;
           end
        end
        %type 2
        for w=1:(W-x+1)/2
           for h=1:H-y+1
               all_ftypes_temp(i,:) = [2,x,y,w,h];
               i=i+1;
           end
        end
        %type 3
        for w=1:(W-x+1)/3
           for h=1:H-y+1
               all_ftypes_temp(i,:) = [3,x,y,w,h];
               i=i+1;
           end
        end
        %type 4
        for w=1:(W-x+1)/2
           for h=1:(H-y+1)/2
               all_ftypes_temp(i,:) = [4,x,y,w,h];
               i=i+1;
           end
        end
    end
end

all_ftypes = all_ftypes_temp(1:i-1,:);

end

