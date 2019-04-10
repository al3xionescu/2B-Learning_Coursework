%
%
function Dmap = task2_2(Xtrain, Ytrain, k, MAT_evecs, MAT_evals, posVec, nbins)
% Input:
%  X   : M-by-D data matrix (double)
%  k   : scalar (integer) - the number of nearest neighbours
%  MAT_evecs : MAT filename of eigenvector matrix of D-by-D
%  MAT_evals : MAT filename of eigenvalue vector of D-by-1
%  posVec    : 1-by-D vector (double) to specity the position of the plane
%  nbins     : scalar (integer) - the number of bins for each PCA axis
% Output:
%  Dmap  : nbins-by-nbins matrix (uint8) - each element represents
%	   the cluster number that the point belongs to.
    

temp = load(MAT_evals);
EVals = temp.values;
temp1 = load(MAT_evecs)
EVecs = temp1.vectors;


std_x = sqrt(EVals(1));
std_y = sqrt(EVals(2));

Xplot = linspace(- 5 * std_x, 5 * std_x, nbins)';
Yplot = linspace(- 5 * std_y,  5 * std_y, nbins)';

% Obtain the grid vectors for the two dimensions

[Xv, Yv] = meshgrid(Xplot, Yplot);
gridX = [Xv(:), Yv(:)]; % Concatenate to get a 2-D point.
Dmap = length(Xv(:));

X = ((EVecs(:,1:2) * gridX') + posVec')'; 

Ypreds = run_knn_classifier(Xtrain, Ytrain, X, k);
Dmap = reshape(Ypreds, nbins, nbins);

figure;
% This function will draw the decision boundaries
cmap = [0.80369089, 0.61814689, 0.46674357;
        0.81411766, 0.58274512, 0.54901962;
        0.58339103, 0.62000771, 0.79337179;
        0.83529413, 0.5584314 , 0.77098041;
        0.77493273, 0.69831605, 0.54108421;
        0.72078433, 0.84784315, 0.30039217;
        0.96988851, 0.85064207, 0.19683199;
        0.93882353, 0.80156864, 0.4219608;
        0.83652442, 0.74771243, 0.61853136;
        0.7019608 , 0.7019608 , 0.7019608];
Xplot = linspace(5 * std_x, - 5 * std_x, nbins)';
Yplot = linspace(5 * std_y,  - 5 * std_y, nbins)';

[~,h] = contourf(Xplot(:), Yplot(:), Dmap);
set(h,'LineColor','none');
colormap(cmap);
 

end