function [sendPre,sendPost]=ClusteredToSlice(ribbon,dimensions)

bySlice=struct([]);

for i = 1:2
    %Find all the ribbon locations as a large matrix
    allPoints=(vertcat(ribbon(i).grouped(:).grouped));
    
    allPoints2=[allPoints(:,1:2),round(allPoints(:,3))];
    %Go through each slice and find which ribbon locations fit onto each
    %slice
    for j = 1:dimensions(3)
        arr=allPoints((allPoints2(:,3)==j),:);
        bySlice(j).points=arr;
    end
    %Store as structure
    ribbon(i).bySlice=bySlice;
end

sendPre=ribbon.bySlice;
sendPost=ribbon(2).bySlice;