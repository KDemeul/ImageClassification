function fdets = PruneDetections(dets)
nd = size(dets,1);

% FIND OVERLAPPING
D = zeros(nd);
rho = 0.5;
for i = 1:nd
    for j = i+1:nd
        int = rectint(dets(i,:),dets(j,:));
        uni = dets(i,3)^2 + dets(j,3)^2 - int;
        if(int/uni > rho)
            D(i,j) = 1;
            D(j,i) = 1;
        end
    end
end

% FIND THE CONNECTED COMPONENT
[S,C] = graphconncomp(sparse(D));
fdets = zeros(S,4);
for s = 1:S
    detnew = [0,0,0,0];
    Set_ind_rect = find(C == s);
    for ind = Set_ind_rect
        detnew = detnew + dets(ind,:);
    end
    detnew = detnew/size(Set_ind_rect,2);
    fdets(s,:) = detnew;
end
end

