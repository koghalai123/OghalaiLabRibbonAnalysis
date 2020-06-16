function [contrastAdjusted]=changeContrast(contrast,data)
contrastAdjusted=zeros(size(data,1),size(data,2),size(data,3));
for i = 1:size(data,3)
    contrastAdjusted(:,:,i)=imadjust((data(:,:,i)),[contrast,1-contrast]);
end
end