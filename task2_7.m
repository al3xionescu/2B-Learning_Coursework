function [CM, acc] = task2_7(X, Ydata, TestData, Answers, epsilon, ratio)
% Input:
%  Xtrain : M-by-D training data matrix (double)
%  Ytrain : M-by-1 label vector (unit8) for Xtrain
%  Xtest  : N-by-D test data matrix (double)
%  Ytest  : N-by-1 label vector (unit8) for Xtest
%  ratio  : scalar (double) - ratio of training data to use.
% Output:
%  CM     : K-by-K matrix (integer) of confusion matrix
%  acc    : scalar (double) of correct classification rate

[raspunsuri, ~, ~] = run_gaussian_classifiers(X(1:int32(ratio*size(X,1)), :), Ydata(1:int32(ratio*size(X,1)), :), TestData, epsilon);
[CM, acc] = comp_confmat(Answers, raspunsuri, 10); % 10 classes

end