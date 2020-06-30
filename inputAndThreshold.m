function [filteredData]=inputAndThreshold(threshold,medRange,data,isNucleus,range)
    %preallocation
    filteredData=zeros(size(data,1),size(data,2),size(data,3),'logical');
    
    %find mins and maxes of data for filtering. This part will need to be
    %changed for efficiency
    globalMax=max(max(max(data)));
    globalMin=min(min(min(data)));
    difference=globalMax-globalMin;
    
    %Scale data by the maxes and mins
    noThreshold=(single(data(range(1):range(2),:,:)-globalMin)/(difference));
    
    
    %If isNucleus, just threshold the data and do a median filter on each
    %slice
    %If ~isNucleus, it is more complicated
    if isNucleus==false
        tic
        for i = 1:size(data,3)
            %edge enhancement
                h=fspecial('sobel');
                f=imfilter(noThreshold(:,:,i),h);
                %median filter
                F=medfilt2(f,medRange);
                %thresholding
                filteredData(range(1):range(2),:,i)=(F>threshold);
                %another median filter
                %filteredData(:,:,i)=gpuArray.medfilt2(G,medRange);
        end
        toc
    else
        tic
        almostFilteredData=noThreshold>threshold;
        for i = 1:size(data,3)
            
            filteredData(range(1):range(2),:,i)=medfilt2(almostFilteredData(:,:,i),medRange);
        end
        toc
    end
    
end