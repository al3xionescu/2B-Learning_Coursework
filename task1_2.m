function res = task1_2(X, Y)
% Input:
%  X : M-by-D data matrix (double)
%  Y : M-by-1 label vector (unit8)
% Output:
%  M : (K+1)-by-D mean vector matrix (double)
%      Note that M(K+1,:) is the mean vector of X.
res = zeros(11,784);
sums = zeros(10,784);
sum1 = zeros(1,784);
number = zeros(10);
for j=1:size(X)
    number(Y(j) + 1) = number(Y(j) + 1) + 1;
    sums(Y(j) + 1,:) = sums(Y(j) + 1,:) + X(j,:);
end

for i=1:10
    res(i,:) = double(sums(i,:))./double(number(i));
    sum1(1,:) = sum1(1,:) + res(i,:);
end
    res(11,:) = double(sum1(1,:))./double(10);
current={};
aux=zeros(28,28);
img={};
for i=1:11
        aux=tomatrix(res(i,:));
        aux=mat2gray(aux);
        current=[current,aux];
    img=[img,current];
    current={};
end
figure
montage(img);
print(figure(1), '-bestfit', sprintf('/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task1_2_imgs.pdf'), '-dpdf');
end