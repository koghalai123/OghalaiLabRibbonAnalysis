function [filteredData]=initialThreshold(threshold,medRange,data,isNucleus,globalMin,globalMax)
    filteredData=zeros(size(data,1),size(data,2),size(data,3),'logical');
    difference=globalMax-globalMin;
    noThreshold=(double(data-globalMin)/(difference));
    if isNucleus==false
        for i = 1:size(data,3)
                h=fspecial('sobel');
                f=imfilter(noThreshold(:,:,i),h);
                F=medfilt2(f,medRange);
                %threshold=prctile(F(:),[percentile],'all');
                G=F>threshold;
                filteredData(:,:,i)=G;%medfilt2(G,medRange);
        end
    else
        %threshold=prctile(noThreshold(:),[percentile],'all');
        almostFilteredData=noThreshold>threshold;
        for i = 1:size(data,3)
            
            filteredData(:,:,i)=medfilt2(almostFilteredData(:,:,i),medRange);
        end
    end
end