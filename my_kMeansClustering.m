%
function [C, idx, SSE] = my_kMeansClustering(X, k, initialCentres, maxIter)
% Input
%   X : N-by-D matrix (double) of input sample data
%   k : scalar (integer) - the number of clusters
%   initialCentres : k-by-D matrix (double) of initial cluster centres
%   maxIter  : scalar (integer) - the maximum number of iterations
% Output
%   C   : k-by-D matrix (double) of cluster centres
%   idx : N-by-1 vector (integer) of cluster index table
%   SSE : (L+1)-by-1 vector (double) of sum-squared-errors

% If 'maxIter' argument is not given, we set by default to 500
if nargin < 4
    maxIter = 500;
end

% This will take a dataset A and random initial cluster centres, and will apply the K-means algorithm.
[N, ~] = size(X); % dataset dimensions
D = zeros(k, N); % KxN matrix for storing distances between cluster centres and observations 

SSEs = zeros(maxIter);
idx = zeros(size(X, 1), 1);
% Iterate ’maxiter’ times
for i = 1:maxIter

    % Compute Squared Euclidean distance (i.e. the squared distance)
    % between each cluster centre and each observation
    for c = 1:k
        D(c,:) = square_dist(X, initialCentres(c,:));
    end
    new_idx = idx;
    [Ds, idx] = min(D);
    SSE = 0;
    [~, d] = size(Ds);
    if d~=1
        for j = 1 : N
            SSE = SSE + Ds(1, j);
        end
    else
        for j = 1 : N
            SSE = SSE + D(1, j);
        end
    end
    SSEs(i) = SSE;

    % Update cluster centres
    for c = 1:k

    % Check the number of samples assigned to this cluster
        if( sum(idx==c) == 0 )
            %warn('k-means: cluster %d is empty', c);
        else
            initialCentres(c, :) = mean( X(idx==c,:) );
        end
    end
    fprintf('[%d] Iteration: \n', i);
    if isequal(new_idx, idx) 
        break
    end
end

C = initialCentres;
  
end
