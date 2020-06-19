
function [filteredData]=initialThreshold(threshold,medRange,data,isNucleus,globalMin,globalMax)
    %preallocation
    filteredData=zeros(size(data,1),size(data,2),size(data,3),'logical');
    %Adjust for global mins and maxes
    difference=globalMax-globalMin;
    noThreshold=(double(data-globalMin)/(difference));
    %Check for the channel before proceeding
    if isNucleus==false
        % if it is a ribbon, then use a sobel transform, median filter, and
        % threshold
        for i = 1:size(data,3)
                h=fspecial('sobel');
                f=imfilter(noThreshold(:,:,i),h);
                F=medfilt2(f,medRange);
                %threshold=prctile(F(:),[percentile],'all');
                G=F>threshold;
                filteredData(:,:,i)=G;%medfilt2(G,medRange);
        end
        
    else
        %Otherwise, just use a threshold and median filter in order to save
        %time
        %%%FIGURE OUT HOW TO DO A 3D MEDIAN FILTER. THIS MAY BE HELPFUL
        %threshold=prctile(noThreshold(:),[percentile],'all');
        almostFilteredData=noThreshold>threshold;
        for i = 1:size(data,3)
            
            filteredData(:,:,i)=medfilt2(almostFilteredData(:,:,i),medRange);
        end
    end
end