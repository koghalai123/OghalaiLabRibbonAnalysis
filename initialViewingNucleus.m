function [S1,S2,P1,P2,P3]=initialViewingNucleus(data,threshold,medRange,range,radius,sensitivity,UIAxes1,UIAxes2,UIAxes3,minimum,maximum)


 %threshold=[.1,.08,.08,.05];
%medRange=[8,8;3,3;3,3;4,4];
% nuclei=1;
% presynaptic=2;
% postsynaptic=3;
% extra=4;



%medRangeArray=[8,8;7,7;7,7;8,8];

isNucleus=true;

%Threshold just one slice
[allFiltered]=initialThreshold(threshold,medRange,data,isNucleus,minimum,maximum);

startValue=1;
stopValue=0;

data2=data/max(data,[],'all');
% sensitivity=.972;
% range=[1200,1500];
% radius=[50,90];

%Find centers and radii
 [storeCenters,storeRadii]=viewPreliminaryData(allFiltered,range,sensitivity,stopValue,startValue,radius);

%graph to the GUI
[S1,S2,P1,P2,P3]=graphInitial(UIAxes1,UIAxes2,UIAxes3,data2,allFiltered,storeCenters,storeRadii);
end
  



