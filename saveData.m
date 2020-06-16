function saveData(fileName,nucleusData,ribbonData,voxel)
txtFile=fopen(fileName,'w');
fprintf(txtFile,'%-s \n','Nucleus Data');
fprintf(txtFile,'%-15s %-15s %-15s %-15s \n','XData(micron)','YData(micron)','ZData(micron)','Radius(micron)');
for i = 1:size(nucleusData,1)
    fprintf(txtFile,'%-5i) %-15.3d %-15.3d %-15.3d %-15.3d \n',i,nucleusData(i,1),nucleusData(i,2),nucleusData(i,3),nucleusData(i,4));
end
txtArr=["Presynaptic Data";"Postsynaptic Data"];
for b=1:2
    fprintf(txtFile,'%-s \n',txtArr(b));
    fprintf(txtFile,'%-15s %-15s %-15s %-15s \n','XData(micron)','YData(micron)','ZData(micron)','Height(micron)');

    for i =1:size(ribbonData(b).grouped,2)
        X=mean(ribbonData(b).grouped(i).grouped(:,1))*voxel(1);
        Y=mean(ribbonData(b).grouped(i).grouped(:,2))*voxel(2);
        Z=mean(ribbonData(b).grouped(i).grouped(:,3))*voxel(3);
        H=((max(ribbonData(b).grouped(i).grouped(:,3))-min(ribbonData(b).grouped(i).grouped(:,3)))/2)*voxel(3);
        fprintf(txtFile,'%-5i) %-15.3d %-15.3d %-15.3d %-15.3d \n',i,X,Y,Z,H);
    end
end

fclose(txtFile);

saveInOrigForm={'Nucleus Data','Presynaptic Ribbon Data','Postsynaptic Ribbon Data';nucleusData,ribbonData(1).grouped,ribbonData(2).grouped};
origFormName=strcat(fileName,"OrigData.mat");
save(origFormName,'saveInOrigForm');

end