function [S1,S2]=graphCircles(UIAxes1,UIAxes3,storeCenters,storeRadii,color)
if nargin==4
    hold(UIAxes1,'on');
    hold(UIAxes3,'on');

    S1=scatter(UIAxes1,storeCenters(:,1),storeCenters(:,2),storeRadii,'g');
    S2=scatter(UIAxes3,storeCenters(:,1),storeCenters(:,2),storeRadii,'g');

    hold(UIAxes1,'on');
    hold(UIAxes3,'on');
else
    
    hold(UIAxes1,'on');
    hold(UIAxes3,'on');

    S1=scatter(UIAxes1,storeCenters(:,1),storeCenters(:,2),storeRadii,color);
    S2=scatter(UIAxes3,storeCenters(:,1),storeCenters(:,2),storeRadii,color);

    hold(UIAxes1,'on');
    hold(UIAxes3,'on');
end
end


