function [ribbonFinal,noFit]=ribbonAnalysis(ribbonPoints)
    ribbonFinal=struct([]);
    idx=dbscan([ribbonPoints(:,1)*.0495,ribbonPoints(:,2)*.0495,ribbonPoints(:,3)*.026],.2,2);
    colors=hsv(max(idx));
    D=ribbonPoints;
    figure;
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
            scatter3(points(:,1),points(:,2),points(:,3),5,colors(j,:));
            ribbonFinal(j).grouped=points;
        elseif j==0
            points=D(0==D(:,4),:);
            scatter3(points(:,1),points(:,2),points(:,3),5,[0,0,0]);
            noFit=points(:,1:3);
        end
    end
end