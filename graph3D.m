function [A,B,C,S1,S2]=graph3D(UIAxes,ribbon,discardedRPre,discardedRPost,newCenters,mu,voxel,isScaled,ribbonRad)

cla(UIAxes);

if isScaled
    forScale=voxel;
    axis(UIAxes,'equal');
elseif ~isScaled
    forScale=ones(1,3);
    axis(UIAxes,'normal');
    
    
    
    
    
end

hold(UIAxes,'on');
[x,y,z]=sphere;
C=gobjects();
for i = 1:size(newCenters,1)
    C(i,1)=surf(UIAxes,forScale(1)*(mu(i)*x+newCenters(i,1))/voxel(1),forScale(2)*(mu(i)*y+newCenters(i,2))/voxel(1),forScale(3)*(mu(i)*z+newCenters(i,3))/voxel(3));
end
color=["b","g"];
A=gobjects();
B=gobjects();
for b = 1:2
    for j = 1:size(ribbon(b).grouped,2)
        
        M=ribbon(b).grouped(j).grouped;
        N=[mean(M(:,1)),mean(M(:,2)),M(1,3)+(M(end,3)-M(1,3))/2,(M(end,3)-M(1,3))/2];
        if b ==1
            A(j,1)=surf(UIAxes,forScale(1)*(ribbonRad*x+N(1)),forScale(2)*(ribbonRad*y+N(2)),forScale(3)*(N(4)*z+N(3)),'FaceColor',color(b),'EdgeColor','none');
        else
            
            B(j,1)=surf(UIAxes,forScale(1)*(ribbonRad*x+N(1)),forScale(2)*(ribbonRad*y+N(2)),forScale(3)*(N(4)*z+N(3)),'FaceColor',color(b),'EdgeColor','none');
        end
    end
end
if size(discardedRPre,1)>0
    S1=scatter3(UIAxes,forScale(1)*discardedRPre(:,1),forScale(2)*discardedRPre(:,2),forScale(3)*discardedRPre(:,3),10,'r');
end
if size(discardedRPost,1)>0
    S2=scatter3(UIAxes,forScale(1)*discardedRPost(:,1),forScale(2)*discardedRPost(:,2),forScale(3)*discardedRPost(:,3),10,'o');
end
hold(UIAxes,'off');

view(UIAxes,3);

% set(A(:,1),'UIAxesaceAlpha',0);
% 
% set(B(:,1),'UIAxesaceAlpha',0);

%axis(UIAxes,'equal');
end