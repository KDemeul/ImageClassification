function fdets = PruneDetections(dets)
nd = size(dets,1);
L = dets(1,3);

% FIND OVERLAPPING
D = zeros(nd);
rho = 50;
for i = 1:nd
    for j = i+1:nd
        int = rectint(dets(1,:),dets(5,:));
        if(int > rho)
            D(i,j) = 1;
            D(j,i) = 1;
        end
    end
end

% FIND THE CONNECTED COMPONENT
[S,C] = graphconncomp(sparse(D));
fdets = zeros(S,4);
for s = 1:S
    xnew = 0;
    ynew = 0;
    Set_ind_rect = find(C == s);
    for ind = Set_ind_rect
        xnew = xnew + dets(ind,1);
        ynew = ynew + dets(ind,2);
    end
    xnew = xnew/size(Set_ind_rect,2);
    ynew = ynew/size(Set_ind_rect,2);
    fdets(s,:) = [xnew,ynew,L,L];
end
end

