function [ribbonFinal,noFit]=ribbonAnalysis(ribbonPoints,voxel)
    ribbonFinal=struct([]);
    %just group the ribbons 
    idx=dbscan([ribbonPoints(:,1)*(voxel(1)),ribbonPoints(:,2)*(voxel(2)),ribbonPoints(:,3)*(voxel(3))],.2,3);
    
    D=ribbonPoints;
    %figure;
    hold on;
    for i = 1:max(idx)+1
        if i <=max(idx)
            D(idx==i,4)=i;
        else
            D(idx==i,4)=i;
        end

    end
    for j = 0:max(idx)
        if j>=1
            points=D(j==D(:,4),:);
            %scatter3(points(:,1),points(:,2),points(:,3),5,colors(j,:));
            ribbonFinal(j).grouped=points;
        elseif j==0
            points=D(0==D(:,4),:);
            %scatter3(points(:,1),points(:,2),points(:,3),5,[0,0,0]);
            noFit=points(:,1:3);
        end
    end
end