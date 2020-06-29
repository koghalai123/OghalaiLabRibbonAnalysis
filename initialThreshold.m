
function [filteredData]=initialThreshold(threshold,medRange,data,isNucleus,globalMin,globalMax,xMin,xMax,startValue,stopValue)
% 
% [filteredData]=initialThreshold(threshold,medRange,data,isNucleus,globalMin,globalMax,xMin,xMax)
%
%   intialThreshold thresholds the data and does some image enhancement. 
% 
%   filteredData is the data after being enhanced and thresholded
%   
%   threshold is a scalar limit for the minimum intensity to be kept
%   medRange is the median range used to remove noise
%   isNucleus is a boolean which determines whether a channel will be
%   treated as a ribbon or as nuclei
%   globalMin is the global min for this channel. Used to make sure the
%   scaling is correct
%   globalMax is the global max for this channel. Used to make sure the
%   scaling is correct
%   xMin is the minimum y value that the user is interested in looking at
%   xMax is the maximum y value that the user is interested in looking at
% 
% 
% 
% 
% 

    if ~exist('xMin','var')
        xMin=1;
        xMax=size(data,2);
    end
    %preallocation
    filteredData=zeros(size(data,1),size(data,2),size(data,3),'logical');
    %Adjust for global mins and maxes
    difference=globalMax-globalMin;
    noThreshold=(single(data(xMin:xMax,:,:)-globalMin)/(difference));
    %Check for the channel before proceeding
    if isNucleus==false
        % if it is a ribbon, then use a sobel transform, median filter, and
        % threshold
        for i = startValue:size(data,3)-stopValue
                h=fspecial('sobel');
                f=imfilter(noThreshold(:,:,i),h);
                F=medfilt2(f,medRange);
                %threshold=prctile(F(:),[percentile],'all');
                G=F>threshold;
                filteredData(xMin:xMax,:,i)=G;%medfilt2(G,medRange);
        end
        
    else
        %Otherwise, just use a threshold and median filter in order to save
        %time
        %%%FIGURE OUT HOW TO DO A 3D MEDIAN FILTER. THIS MAY BE HELPFUL
        %threshold=prctile(noThreshold(:),[percentile],'all');
        almostFilteredData(xMin:xMax,:,:)=noThreshold>threshold;
        for i = 1:size(data,3)
            
            filteredData(xMin:xMax,:,i)=medfilt2(almostFilteredData(xMin:xMax,:,i),medRange);
        end
    end
end