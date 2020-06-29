function [toReturn]=removePreCloseRib(nucleusData,ribbonData,voxel)
newRibbonData=struct([]);
for b = 1:2    
    newRibbonData=struct([]);
    avgPre=cell2mat(transpose(arrayfun(@(s) mean(s(:).grouped,1), ribbonData(b).grouped, 'UniformOutput', false)));
    scaledPre=[avgPre(:,1)*voxel(1),avgPre(:,2)*voxel(2),avgPre(:,3)*voxel(3)];
    dist=zeros(size(scaledPre,1),size(nucleusData,1));
    for i = 1:size(nucleusData,1)
        dist(:,i)=(((nucleusData(i,1)-scaledPre(:,1)).^2)+((nucleusData(i,2)-scaledPre(:,2)).^2)+((nucleusData(i,3)-scaledPre(:,3)).^2)).^(1/2);
    end
    [row,col]=find(dist<3.2);
    toDelete=[];
    toDelete=unique(row);
    allGroups=[1:size(scaledPre,1)];
    counter=1;
    for group=1:size(scaledPre,1)
        if ~any(toDelete==group)
            newRibbonData(counter).grouped=ribbonData(b).grouped(allGroups(group)).grouped;
            counter=counter+1;
        end
    end
    ribbonData(b).grouped=newRibbonData;
end    
    toReturn=ribbonData;
end