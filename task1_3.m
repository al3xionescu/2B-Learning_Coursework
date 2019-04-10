function [EVecs, EVals, CumVar, MinDims] = task1_3(X)
[EVecs, EVals] = comp_pca(X);
CumVar = cumsum(EVals);
figure

plot((0:783),CumVar);
xlabel('# of principal components');
ylabel('Cumulative variance');
print(figure(1), '-bestfit', '/afs/inf.ed.ac.uk/user/s17/s1704634/PROB/inf2b-cw2/task1_3_graph.pdf', '-dpdf');
CumVarPercent = CumVar/sum(EVals);
MinDims = zeros(4,1);
for i=1:size(CumVarPercent,1)
    if CumVarPercent(i)>=0.7*CumVarPercent(size(CumVarPercent,1)) && MinDims(1)==0
        MinDims(1) = i;
    end
    if CumVarPercent(i)>=0.8*CumVarPercent(size(CumVarPercent,1)) && MinDims(2)==0
        MinDims(2) = i;
    end
    if CumVarPercent(i)>=0.9*CumVarPercent(size(CumVarPercent,1)) && MinDims(3)==0
        MinDims(3) = i;
    end
    if CumVarPercent(i)>=0.95*CumVarPercent(size(CumVarPercent,1)) && MinDims(4)==0
        MinDims(4) = i;
    end 
end

end