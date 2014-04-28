function fpic = MakeFeaturePic(ftype, W, H)
type = ftype(1);
x = ftype(2);
y = ftype(3);
w = ftype(4);
h = ftype(5);

switch type
    case 1,
        pic = [-ones(h,w);ones(h,w)];
    case 2,
        pic = [ones(h,w),-ones(h,w)];
    case 3,
        pic = [ones(h,w),-ones(h,w),ones(h,w)];
    otherwise,
        pic = [ones(h,w), -ones(h,w);
               -ones(h,w), ones(h,w)];
end

[hpic,wpic] = size(pic);

A = zeros(max(0,y-1),W);
B = zeros(hpic,max(0,x-1));
C = zeros(hpic,max(W-(x+wpic)+1,0));
D = zeros(max(H-(y+hpic)+1,0),W);

fpic = [A;
        B, pic, C;
        D];
end

