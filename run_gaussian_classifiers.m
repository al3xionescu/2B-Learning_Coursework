function [Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon)
% Input:
%   Xtrain : M-by-D training data matrix (double)
%   Ytrain : M-by-1 label vector for Xtrain (uint8)
%   Xtest  : N-by-D test data matrix (double)
%   epsilon : A scalar variable (double) for covariance regularisation
% Output:
%  Ypreds : N-by-1 matrix (uint8) of predicted labels for Xtest
%  Ms     : K-by-D matrix (double) of mean vectors
%  Covs   : K-by-D-by-D 3D array (double) of covariance matrices

%YourCode - Bayes classification with multivariate Gaussian distributions.

N = size(Xtest, 1);
D = size(Xtrain, 2);
Ms = zeros(D, 10);
Covs = zeros(D,D,10);


for k = 1:10
    samples = Xtrain(Ytrain == k - 1, :);
    mu = myMean(samples);
    Ms(:,k) = mu;
    Covs(:, :, k) = findCov(samples) + epsilon * eye(D); 
end


post_log = zeros(N, 10);
for k = 1:10
    mu = Ms(:,k);
    sigma = Covs(:,:,k);
    diffMat = Xtest' - repmat(mu, 1, N);
    post_matrix = - 0.5 * diffMat' * inv(sigma) * diffMat - 0.5 * logdet(sigma);
    post_log(:,k) = diag(post_matrix);
end

[~, Ypreds] = max(post_log, [], 2);
Ypreds = Ypreds - ones(size(Ypreds, 1), size(Ypreds, 2));

end