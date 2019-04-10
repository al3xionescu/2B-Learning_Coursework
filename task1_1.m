function task1_1(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
res = zeros(10,10,784);
number = ones(10);
count = 1;
for j=1:size(X)
    if number(Y(j) + 1)<=10
        res(Y(j) + 1, number(Y(j) + 1),:) = X(j,:);
        number(Y(j) + 1) = number(Y(j) + 1) + 1;
        count = count + 1;
    end
    if count == 101
        break
    end
end

current={};
aux=zeros(28,28);
img={};
for i=1:10
    img={};
    for j=1:10
        aux=tomatrix(res(i,j,:));
        aux=mat2gray(aux);
        current=[current,aux];
    end
    img=[img,current];
    current={}; 
    figure
    montage(img);
    print(figure(i), '-bestfit', sprintf('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task1_1_imgs_class%d.pdf', i), '-dpdf');
end
end
