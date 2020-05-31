
dataFile='IB09MidControlLeft2.czi';

%keep track of which channel is the nuclei, presynaptic ribbon,
%postsynaptic density,etc
nuclei=1;
presynaptic=2;
postsynaptic=3;

%load in data, find mins and maxes, and get the meta data for the file
[voxel,dimensions,minMax,allData]=initialize(dataFile,1,2,3,4);

%set the thresholds for the data
 threshold=[.1,.08,.08,.05];
 
 %set the range forh te median filter
medRangeArray=[8,8;7,7;7,7;8,8];

%ignore this
plainData=allData;

%preallocate space for the filtered data based on metadata
allFiltered=zeros(dimensions(1),dimensions(2),dimensions(3),'logical');


%For the following fuinction to filter data
isNucleus=[true,false,false,false];

%filter data by channel
for b =1:4
    [allFiltered(:,:,:,b)]=inputAndThreshold(threshold(b),medRangeArray(b,:),allData(:,:,:,b),isNucleus(b));
end

%set limits on which slices we want to look at
startValue=1;
stopValue=20;

%set sensitivity for circle detection of nuclei
sensitivity=.972;
%set Y boundaries for the nuclei
range=[1200,1500];
%set estimated radius range of the nuclei
radius=[50,90];

%finds circles on each slice for hte nucleus channel using the filtered
%data
 [storeCenters,storeRadii]=viewPreliminaryData(allFiltered(:,:,:,nuclei),range,sensitivity,stopValue,startValue,radius);

 %clusters them together and outputs the final nucleus centers and radii
  [newCenters,mu,discardedN]=clusterNuclei(storeCenters,storeRadii,voxel);

%set Y range for ribbons
     range=[1000,2048];
    ribbonSlices=[presynaptic,postsynaptic];
    %set estimated radius of ribbons
    ribbonRadius=10;
    %search range for density based clustering
    epsilon=10;
    %min # of points to be considered ribbon
    minGroup=5;
    
    
    ribbon=struct([]);
    noFit=struct([]);
    
    %go through the presynaptic ribbon and postsynaptic density channels
    %for all slices using the filtered data
    for i = 1:2
        %Find all ribbon locations on each slice
        [ribbon(i).points]=ribbonStuff(allFiltered(:,:,:,ribbonSlices(i)),epsilon,minGroup,range,startValue,stopValue);

        %Group the ribbon locations together to create a 3D ribbon location
        %array. This part does nto work very well yet.
        [ribbon(i).grouped,noFit]=ribbonAnalysis(ribbon(i).points);
        if i==1
            discardedRPre=noFit;
        else
            discardedRPost=noFit;
        end
    end
bySlice=struct([]);


%Ignore this part. It is just used to save time when I am experimenting
%with the GUI
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