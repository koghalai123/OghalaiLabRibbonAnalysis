function [ribbons]=ribbonStuff(scaledData,epsilon,minGroup,range,startValue,stopValue)



for j = startValue:size(scaledData,3)-stopValue
        %find points in the data
        [col,row]=find(scaledData(:,:,j)==1);
        %do a density based cluster on the points in the data to find where
        %the ribbons are on this slice
        if size(row,1)>0
            idx=dbscan([row,col],epsilon,minGroup);
            average=zeros(max(idx),2,'single');
            %remove points that dont fit the clusters
            for i =1:max(idx)
                inGroup=find(idx==i);
                theGroup=[row(inGroup),col(inGroup)];
                average(i,:)=[median(theGroup(:,1)),median(theGroup(:,2))];
            end
            centers=average;
            %remove those outside acceptable y range
            
            if size(centers,1)>0
                L=single(centers(:,2)<range(2)) .* single(centers(:,2)>range(1));
                centers=[nonzeros(L.*centers(:,1)),nonzeros(L.*centers(:,2))];
            end

            
%             %Add centers and radius to structure for storage 
            storeCenters2(j).centers=[centers,ones(size(centers,1),1)*j];
        end
end
if exist('storeCenters2', 'var')
    ribbons=vertcat(storeCenters2(:).centers);
else
    ribbons=[];
end

   
  end
    