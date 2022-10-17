function [ActivityStateEntropy] = ActEn(data)
%Calculates the Activity-State Entropy of a data matrix, where columns are
%variables (voxels) and rows are observations. 
[~,~,~,~, explained] = pca(data);
percentage = explained ./ sum(explained);
ActivityStateEntropy = -sum(percentage .* log(percentage));
end
