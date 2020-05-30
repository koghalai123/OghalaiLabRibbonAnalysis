function [allData] = splitToMatrices(data,nuclei,presynaptic,postsynaptic,extra)


offset=[nuclei,presynaptic,postsynaptic,extra];


allData=zeros(size(data{1,1}{1,1},1),size(data{1,1}{1,1},2),round(size(data{1,1},1)/4),4,'single');

%Separate data into an array with the 4th dimension as channels, and the
%3rd as slice #. 
for b =1:4
    series_planes = data{1,1}(offset(b):4:size(data{1,1},1),1);
    series_planes = cat(3, series_planes{:});
    allData(:,:,:,b)=series_planes;
end




end

