function [R1,R2]=representNAndR(NAssociated,RAssociated,UIAxes)
allVec=struct([]);

N=scatter3(UIAxes,0,0,0,'Marker','.','CData',[0,0,0],'SizeData',5000);
for b = 1:2
    vec1=[];
    for i=1:size(NAssociated,1)
        for j = 1:size(RAssociated(b).associated(i).gobject,1)
            vec1=[vec1;RAssociated(b).associated(i).gobject(j,1).UserData(1,1:3)-NAssociated(i,1).UserData(1,1:3)];
        end
    end
    allVec(b).vec=vec1;
end
hold(UIAxes,'on');
R1=scatter3(UIAxes,allVec(1).vec(:,1),allVec(1).vec(:,2),allVec(1).vec(:,3),'Marker','.','CData',[0,0,1]);
R2=scatter3(UIAxes,allVec(2).vec(:,1),allVec(2).vec(:,2),allVec(2).vec(:,3),'Marker','.','CData',[0,1,0]);
hold(UIAxes,'off');
axis(UIAxes,'equal');

legend(UIAxes,[R1(1,1),R2(1,1),N],{'Presynaptic','Postsynaptic','Nuclei'});


end