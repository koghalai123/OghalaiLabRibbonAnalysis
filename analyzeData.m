function [allFiltered,newCenters,mu,sendPre,sendPost]=analyzeData(nuclei,presynaptic,postsynaptic,threshold,medRange,startValue,stopValue,sensitivity,rangeN,rangeR,radius,epsilon,minGroup,voxel,dimensions,allData)

%%%%THIS IS JUST THE FUNCTION FORM OF LOADDATA. IT IS USED IN THE GUI FOR
%%%%DOING EVERYTHING IN LOAD DATA.

% dataFile='IB09MidControlLeft2.czi';
% 
% 
% nuclei=1;
% presynaptic=2;
% postsynaptic=3;

%  threshold=[.1,.08,.08,.05];
% medRange=[8,8;3,3;3,3;4,4];

% plainData=allData;

allFiltered=zeros(dimensions(1),dimensions(2),dimensions(3),'logical');
% medRange=[8,8;7,7;7,7;8,8];
for b =1:4
    [allFiltered(:,:,:,b)]=inputAndThreshold(threshold(b),medRange(b,:),allData(:,:,:,b),b==nuclei);
end
% startValue=1;
% stopValue=20;


% sensitivity=.972;
% range=[1200,1500];
% radius=[50,90];

 [storeCenters,storeRadii]=viewPreliminaryData(allFiltered(:,:,:,nuclei),rangeN,sensitivity,stopValue,startValue,radius);

  [newCenters,mu]=clusterNuclei(storeCenters,storeRadii,voxel);
  

%      rangeR=[1000,2048];
    ribbonSlices=[presynaptic,postsynaptic];
%     epsilon=10;
%     minGroup=5;
    ribbon=struct([]);
    noFit=struct([]);
    for i = 1:2
        
        [ribbons]=ribbonStuff(allFiltered(:,:,:,ribbonSlices(i)),epsilon,minGroup,rangeR,startValue,stopValue);
        ribbon(i).points=ribbons;
        [ribbon(i).grouped,noFit(i).points]=ribbonAnalysis(ribbon(i).points);
    end
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
    
    
    
    
%     toGraph=struct([]);
%     for i = 1:size(ribbon.a,1)
%     end
