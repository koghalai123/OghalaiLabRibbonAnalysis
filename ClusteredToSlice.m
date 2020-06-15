function [sendPre,sendPost]=ClusteredToSlice(ribbon)

bySlice=struct([]);

for i = 1:2
    allPoints=(vertcat(ribbon(i).grouped(:).grouped));
    allPoints2=[allPoints(:,1:2),round(allPoints(:,3))];
    for j = 1:max(allPoints2(:,3))
        arr=allPoints((allPoints2(:,3)==j),:);
        if size(arr,1)>0
            bySlice(j).points=arr;
        end
    end
    ribbon(i).bySlice=bySlice;
end
sendPre=ribbon.bySlice;
sendPost=ribbon(2).bySlice;