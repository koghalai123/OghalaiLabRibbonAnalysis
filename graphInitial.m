function [S1,S2,P1,P2,P3]=graphInitial(UIAxes1,UIAxes2,UIAxes3,data,allFiltered,storeCenters,storeRadii)
UIAxes1.cla;
UIAxes2.cla;
UIAxes3.cla;

% zoom(UIAxes1,'off');
% UIAxes1.XLimMode = 'auto';
% UIAxes1.YLimMode = 'auto';
% 
% zoom(UIAxes2,'off');
% UIAxes2.XLimMode = 'auto';
% UIAxes2.YLimMode = 'auto';
% 
% zoom(UIAxes3,'off');
% UIAxes3.XLimMode = 'auto';
% UIAxes3.YLimMode = 'auto';


P1=imshow(data,'parent',UIAxes1);


P2=imshow(allFiltered,'parent',UIAxes2);
axis(UIAxes2,'equal');


P3=imshow(allFiltered,'parent',UIAxes3);
axis(UIAxes3,'equal');

if size(storeCenters,1)>0
    [S1,S2]=graphCircles(UIAxes1,UIAxes3,storeCenters,storeRadii);
else
    S1=1;
    S2=2;
end

end