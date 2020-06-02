function [A,B,S1,S2]=graph3D(UIAxes,ribbon,discardedRPre,discardedRPost,newCenters,mu,voxel,~)




hold(UIAxes,'on');
[x,y,z]=sphere;
for i = 1:size(newCenters,1)
    surf(UIAxes,(mu(i)*x+newCenters(i,1))/voxel(1),(mu(i)*y+newCenters(i,2))/voxel(1),(mu(i)*z+newCenters(i,3))/voxel(3));
end
color=["b","g"];
A=gobjects();
B=gobjects();
for b = 1:2
    for j = 1:size(ribbon(b).grouped,2)
        
        M=ribbon(b).grouped(j).grouped;
        N=[mean(M(:,1)),mean(M(:,2)),M(1,3)+(M(end,3)-M(1,3))/2,(M(end,3)-M(1,3))/2];
        if b ==1
            A(j,1)=surf(UIAxes,10*x+N(1),10*y+N(2),N(4)*z+N(3),'FaceColor',color(b),'EdgeColor','none');
        else
            
            B(j,1)=surf(UIAxes,10*x+N(1),10*y+N(2),N(4)*z+N(3),'FaceColor',color(b),'EdgeColor','none');
        end
    end
end
S1=scatter3(UIAxes,discardedRPre(:,1),discardedRPre(:,2),discardedRPre(:,3),10,'r');
S2=scatter3(UIAxes,discardedRPost(:,1),discardedRPost(:,2),discardedRPost(:,3),10,'o');

hold(UIAxes,'off');

view(UIAxes,3);

% set(A(:,1),'UIAxesaceAlpha',0);
% 
% set(B(:,1),'UIAxesaceAlpha',0);

% axis(UIAxes,'equal');
end