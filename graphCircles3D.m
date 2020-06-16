function [S1]=graphCircles3D(UIAxes1,storeCenters,storeRadii,slice,color)
    
    hold(UIAxes1,'on');

    S1(:,1)=scatter3(UIAxes1,storeCenters(:,1),storeCenters(:,2),slice*ones(size(storeCenters,1),1),storeRadii,color,'UserData',slice);

    hold(UIAxes1,'on');
    

end