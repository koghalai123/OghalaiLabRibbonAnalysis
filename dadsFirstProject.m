dataFile='IB09MidControlLeft2.czi';
threshold=[.07,.07,.07,.07];
%[scaledData,data]=inputAndThreshold(dataFile,threshold);

% range=[1200,1500];
% sensitivity=.9889;
% stopValue=88;
% nucleiSlice=0;
% startValue=0;
% [storeCenters]=viewPreliminaryData(scaledData,range,sensitivity,stopValue,nucleiSlice,startValue);
% 
% numNuclei=14;
% [array,newCenters,mu]=clusterNuclei(storeCenters,numNuclei);
% ribbon=struct();
% sensitivity=.965;
% range=[1200,1700];
% for i = 1:2
%     radius=[8,8];
%     slice=[1,2];
%     [ribbons,Counter]=ribbonStuff(scaledData,slice(i),sensitivity,radius,newCenters,mu,range);
%     finalCounter(i)=Counter;
%     if i==1
%         ribbon.a=ribbons;
%     elseif i==2
%         ribbon.b=ribbons;
%     end
%         
% end


[IDX,pairs]=findPairs(ribbonData.a,ribbonData.b,radius);
