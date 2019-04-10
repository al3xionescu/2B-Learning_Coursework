function [res] = tomatrix(X)
res = zeros(28,28);
for i = 1:28
    for j = 1:28
        res(i,j) = X(28*(i-1) + j);
    end
end
end