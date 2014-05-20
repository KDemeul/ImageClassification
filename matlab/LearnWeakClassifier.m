function [theta, p, err] = LearnWeakClassifier(ws, fs, ys)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

mup = sum(ws.*fs.*ys)/sum(ws.*ys);
mun = sum(ws.*fs.*(1-ys))/sum(ws.*(1-ys));

theta = (mup+mun)/2;

epsilon_moins_un = sum(ws.*abs(ys-double(-fs<-theta)));
epsilon_un = sum(ws.*abs(ys-double(fs<theta)));

[~,indice_p] = min([epsilon_moins_un,epsilon_un]);
if indice_p==1
    p = -1;
    err = epsilon_moins_un;
else
    p = 1;
    err = epsilon_un;
end
end