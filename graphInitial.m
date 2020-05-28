function [S1,S2,P1,P2,P3]=graphInitial(UIAxes1,UIAxes2,UIAxes3,data,allFiltered,storeCenters,storeRadii)
UIAxes1.cla;
UIAxes2.cla;
UIAxes3.cla;

P1=imshow(data,'parent',UIAxes1);
axis(UIAxes1,'equal');

P2=imshow(allFiltered,'parent',UIAxes2);
axis(UIAxes2,'equal');


P3=imshow(allFiltered,'parent',UIAxes3);
axis(UIAxes3,'equal');


hold(UIAxes1,'on');
hold(UIAxes3,'on');


theta=linspace(0,2*pi,8);

%make a variable for cos and sin so that it is not calculated every time

%plot(v, 'o');
%plot(v, 'o', 'MarkerSize', 4);



S1=scatter(UIAxes1,storeCenters(:,1),storeCenters(:,2),storeRadii,'r');
S2=scatter(UIAxes3,storeCenters(:,1),storeCenters(:,2),storeRadii,'r');



hold(UIAxes1,'on');
hold(UIAxes3,'on');
end