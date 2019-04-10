function task1_6(MAT_ClusterCentres)
sol={};
C = cell2mat(struct2cell(load(MAT_ClusterCentres)));
for c=1:size(C,1)
    img=mat2gray(tomatrix(C(c,:)));
    sol=[sol img];
end
figure
montage(sol);
end