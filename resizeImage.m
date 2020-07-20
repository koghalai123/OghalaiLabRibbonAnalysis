function [resizedAllData,resizedDimensions,resizedVoxel]=resizeImage(allData,dimensions,voxel,X,Y)
resizedAllData=zeros(X,Y,dimensions(3));
resizedDimensions=[X,Y,dimensions(3)];
resizedVoxel=[voxel(1)*dimensions(1)/X,voxel(2)*dimensions(2)/Y,voxel(3)];
for b = 1:4
    for i = 1:dimensions(3)
        resizedAllData(:,:,i,b)=imresize(allData(:,:,i,b),[X,Y]);

    end
end
end