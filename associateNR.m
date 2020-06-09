function [n,all]=associateNR(ribbon,newCenters,mu,voxel,UIAxes)
newCenters2=[];
newCenters2=newCenters./voxel;
mu2=mu/voxel(1);
ribbonClusters=struct([]);
ribbonClusters2=struct([]);
all=struct([]);

hold(UIAxes,'on');
[x,y,z]=sphere;
n=gobjects;
r=gobjects;

for b =1:2
    newCenters2=[];
    newCenters2=newCenters./voxel;
    mu2=mu/voxel(1);
    for i =1:size(ribbon(b).grouped,2)
        ribbonClusters(b).average(i,1:3)=mean(ribbon(b).grouped(i).grouped(:,1:3));
        
    end



    for j = 1:size(newCenters2,1)
        B=single(ribbonClusters(b).average(:,1)>newCenters2(j,1)-mu2(j)) .* single(ribbonClusters(b).average(:,1)<newCenters2(j,1)+mu2(j));
        C=ribbonClusters(b).average(B==1,:);
        ribbonClusters2(b).grouped(j).grouped=C;
        
    end


    distanceX=zeros(size(newCenters2,1),size(newCenters2,1));
    for i = 1:size(newCenters2,1)
        distanceX(i,1:i)=abs(newCenters2(1:i,1)-newCenters2(i,1));

    end

    A=single(distanceX<130) .* single(distanceX ~= 0);
    [row,col]=find(A==1);
    toDeleteUnique=unique([row;col]);
    newCenters2(toDeleteUnique,:)=[];
    mu2(toDeleteUnique,:)=[];

    for i = size(toDeleteUnique,1):-1:1
        ribbonClusters2(b).grouped(toDeleteUnique(i)).grouped=[];
    end



    counter=1;

    for num = 1:size(newCenters,1)
        temp=gobjects;
        for i = 1:size(ribbonClusters2(b).grouped(num).grouped,1)
            
            temp(i,1)=surf(UIAxes,10*x+ribbonClusters2(b).grouped(num).grouped(i,1),10*y+ribbonClusters2(b).grouped(num).grouped(i,2),10*z+ribbonClusters2(b).grouped(num).grouped(i,3));
           
        end
        if size(ribbonClusters2(b).grouped(num).grouped,1)>0
            all(b).associated(counter).gobject=temp;
            counter=counter+1;
        end
        
    end

end
for num = 1:size(newCenters2,1)
    n(num,1)=surf(UIAxes,mu2(num)*x+newCenters2(num,1),mu2(num)*y+newCenters2(num,2),mu2(num)*z+newCenters2(num,3))
    
end



hold(UIAxes,'off');
axis(UIAxes,'equal');
view(UIAxes,3);
end