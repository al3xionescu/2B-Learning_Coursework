%
%
function task2_1(Xtrain, Ytrain, Xtest, Ytest, Ks)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  Ks     : 1-by-L vector (integer) of the numbers of nearest neighbours in Xtrain

[Ypreds] = run_knn_classifier(Xtrain, Ytrain, Xtest, Ks);

for knns=1:size(Ks, 2)
    [cm, acc] = comp_confmat(Ytest, Ypreds(knns,:),10);
    save(sprintf('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task2_1_cm%d.mat', Ks(knns)), 'cm');
    N = size(Ypreds(knns,:), 2);
    fprintf('k=%d\n', Ks(knns));
    fprintf('N=%d\n', N);
    fprintf('Nerrs=%d\n', (1-acc)*N);
    fprintf('acc=%d\n\n', acc);
end

end