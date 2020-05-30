function [filteredData]=inputAndThreshold(threshold,medRange,data,isNucleus)
    %preallocation
    filteredData=zeros(size(data,1),size(data,2),size(data,3),'logical');
    
    %find mins and maxes of data for filtering. This part will need to be
    %changed for efficiency
    globalMax=max(max(max(data)));
    globalMin=min(min(min(data)));
    difference=globalMax-globalMin;
    
    %Scale data by the maxes and mins
    noThreshold=(double(data-globalMin)/(difference));
    
    
    %If isNucleus, just threshold the data and do a median filter on each
    %slice
    %If ~isNucleus, it is more complicated
    if isNucleus==false
        for i = 1:size(data,3)
            %edge enhancement
                h=fspecial('sobel');
                f=imfilter(noThreshold(:,:,i),h);
                %median filter
                F=medfilt2(f,medRange);
                %thresholding
                G=(F>threshold);
                %another median filter
                filteredData(:,:,i)=medfilt2(G,medRange);
        end
    else
        almostFilteredData=noThreshold>threshold;
        for i = 1:size(data,3)
            
            filteredData(:,:,i)=medfilt2(almostFilteredData(:,:,i),medRange);
        end
    end
end