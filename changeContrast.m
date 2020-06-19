function [contrastAdjusted]=changeContrast(contrast,data)
%preallocate space
contrastAdjusted=zeros(size(data,1),size(data,2),size(data,3));
%Change the contrast of the slices
for i = 1:size(data,3)
    contrastAdjusted(:,:,i)=imadjust((data(:,:,i)),[contrast,1-contrast]);
end
end