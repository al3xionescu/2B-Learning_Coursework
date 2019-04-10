function task1_4(EVecs)
img={};
for i=1:10
    aux=tomatrix(EVecs(:,i));
    aux=mat2gray(aux);
    img=[img,aux];
end
figure
img=montage(img);
print(figure(2), '-bestfit', '/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task1_4_imgs.pdf', '-dpdf');
end