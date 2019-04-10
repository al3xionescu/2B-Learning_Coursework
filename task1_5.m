function task1_5(X, Ks)
% Input:
%  X  : M-by-D data matrix (double)
%  Ks : 1-by-L vector (integer) of the numbers of nearest neighbours
for k=1:size(Ks,2)
    tic
    [C,idx,SSE]=my_kMeansClustering(X,Ks(k),X(1:Ks(k),:),500);
    save(sprintf('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task1_5_c_%d.mat', Ks(k)), 'C');
    save(sprintf('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task1_5_idx_%d.mat', Ks(k)), 'idx');
    save(sprintf('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task1_5_sse_%d.mat', Ks(k)), 'SSE');
    print(figure(k), '-bestfit', sprintf('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/SSEs for k=%d.pdf', Ks(k)), '-dpdf');
    toc
end
end


