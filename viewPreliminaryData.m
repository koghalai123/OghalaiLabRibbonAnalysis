function [storeCenters,storeRadii]=viewPreliminaryData(nucleiData,range,sensitivity,stopValue,startValue,radius)
%sensitivty 9.883, range=[1200,1500], stopValue=88, nucleiSlice=0 THIS IS ONLY FOR THE
%TESTDATA


    storeCenters=[];
    storeRadii=[];
    %Go through each slice in the nuclei channel
    for j = startValue:size(nucleiData,3)-stopValue
        %find circles
        [centers, radii] = imfindcircles(nucleiData(:,:,j),radius,'Sensitivity',sensitivity);
        
       %determine if the nuclei centers are within acceptable Y range and
       %remove those which are not
        centers2=[];
        if size(centers,1)>0
            L=single(centers(:,2)<range(2)) .* single(centers(:,2)>range(1));
            centers2=[nonzeros(L.*centers(:,1)),nonzeros(L.*centers(:,2))];
            radii=nonzeros(L.*radii);
        end
       
        %Store the data.
        if size(centers2,1)>0
            storeCenters=[storeCenters;centers2,ones(size(centers2,1),1)*j];
            storeRadii=[storeRadii;radii];
        end
    end
    end