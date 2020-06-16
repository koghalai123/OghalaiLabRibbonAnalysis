function [S1,S2,P1,P2,P3]=initialViewingRibbon(UIAxes1,UIAxes2,UIAxes3,data,medRange,threshold,epsilon,minGroup,range,radius,minimum,maximum)

isNucleus=false;

allFiltered=initialThreshold(threshold,medRange,data,isNucleus,minimum,maximum);

startValue=1;
stopValue=0;





% range=[1000,2048];
% ribbonRadius=10;
% epsilon=10;
% minGroup=5;

data2=data/max(data,[],'all');

[ribbons]=ribbonStuff(allFiltered,epsilon,minGroup,range,startValue,stopValue);
if size(ribbons,1)>0
    [S1,S2,P1,P2,P3]=graphInitial(UIAxes1,UIAxes2,UIAxes3,data2,allFiltered,ribbons(:,1:2),radius);
else
    [S1,S2,P1,P2,P3]=graphInitial(UIAxes1,UIAxes2,UIAxes3,data2,allFiltered,[],radius);
end
end