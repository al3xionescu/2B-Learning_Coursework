function [EVecs, EVals] = comp_pca(X)
[V,D] = eig(findCov(X));
for i=1:size(V,2)
    if V(1,i) < 0
        V(:,i) = (-1) * V(:,i);
    end
end
[d,ind] = sort(diag(D),'descend');
Ds = D(ind,ind);
Vs = V(:,ind);
EVecs = Vs;
EVals = diag(Ds);
end
