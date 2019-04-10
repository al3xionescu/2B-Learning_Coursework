%
%
function Dmap = task2_6(X, Y, epsilon, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X        : M-by-D data matrix (double)
%  Y        : M-by-1 label vector (uint8)
%  epsilon  : scalar (double) for covariance matrix regularisation
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec   : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) denoting the number of bins for each PCA axis
% Output
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.

    %Importing eigen vectors
    EVecs_str = load(MAT_evecs);
    EVectors = EVecs_str.vectors;
    
    %Importing eigen values
    EVals_str = load(MAT_evals);
    EValues = EVals_str.values;
    
    EigVecs = EVectors(:,(1:2));
    %taking the inverse 
    Inverse_PCA = EigVecs';
    
    % standard deviations of each axes
    std_dvt =  sqrt(EValues(1:2)');
    
    a  = linspace(-5* std_dvt(1), 5* std_dvt(1), nbins);
    b  = linspace(-5* std_dvt(2), 5* std_dvt(2), nbins);
    % create a matrix nbins x nbins to store the colour
    Dmap = zeros(nbins, nbins);    
    test_data = zeros(nbins*nbins, 2);
    % Create a for loop to understand which bin is in which cluster
    for i = 1:nbins
        for j = 1:nbins
            test_data((i-1)*nbins+j,:) = [a(i) b(j)];
        end
    end
    Xtrn_2D = (X-posVec)*EigVecs;
    [Ypreds, ~, ~] = run_gaussian_classifiers(Xtrn_2D, Y, test_data, epsilon);
    for i = 1:nbins
         for j = 1:nbins
         Dmap(i,j) = Ypreds((i-1)*nbins+j,1);
         end
    end
    
    contourf(rot90(Dmap))   

end