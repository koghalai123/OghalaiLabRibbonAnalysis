function [contrastAdjusted]=changeContrast(contrast,data)
% 
% [contrastAdjusted]=changeContrast(contrast,data)
%
%   contrastAdjusted is the contrast adjusted data
% 
%   contrast is the contrast value that the user wants
%   data is the brightness adjusted data that is now being contrast
%   adjusted
% 
% 

%preallocate space
contrastAdjusted=zeros(size(data,1),size(data,2),size(data,3));
%Change the contrast of the slices
for i = 1:size(data,3)
    contrastAdjusted(:,:,i)=imadjust((data(:,:,i)),[contrast,1-contrast]);
end
end