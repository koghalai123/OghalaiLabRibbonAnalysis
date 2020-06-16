function [sendPre,sendPost]=ClusteredToSlice(ribbon,dimensions)

bySlice=struct([]);

for i = 1:2
    allPoints=(vertcat(ribbon(i).grouped(:).grouped));
    allPoints2=[allPoints(:,1:2),round(allPoints(:,3))];
    for j = 1:dimensions(3)
        arr=allPoints((allPoints2(:,3)==j),:);
        bySlice(j).points=arr;
    end
    ribbon(i).bySlice=bySlice;
end
sendPre=ribbon.bySlice;
sendPost=ribbon(2).bySlice;