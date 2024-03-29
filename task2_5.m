%
%
function task2_5(Xtrain, Ytrain, Xtest, Ytest, epsilon)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  epsilon : a scalar variable (double) for covariance regularisation

tic
[Ypreds, Ms, Covs] = run_gaussian_classifiers(Xtrain, Ytrain, Xtest, epsilon);
toc

[cm, acc] = comp_confmat(Ytest, Ypreds, 10); % 10 classes

save('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task2_5_cm.mat', 'cm');
M10 = Ms(:,10);
save('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task2_5_m10.mat', 'M10');
Cov10 = Covs(:,:,10);
save('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task2_5_cov10.mat', 'Cov10');

N = size(Xtest, 1);
fprintf('N=%d\n', N);
fprintf('Nerrs=%d\n', (1-acc)*N);
fprintf('acc=%d\n\n', acc);

end