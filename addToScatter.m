function addToScatter(app,S,g,layer)

%Delete all the scatter objects
delete(app.Scat3D);
%Make a new object to hold the scatter objects
app.Scat3D=gobjects();
%Go through each slice and determine whether it has a ribbon/nucleus on it
for slice=1:app.dimensions(3)
    %Find data about the organ being looked at
    [Radii,Centers,~,~]=findStats(app,str2double(app.CheckThatDataDropDown.Value),slice);
    %If there is any circle data, then plot it on the slice stack
    if size(Centers,1)>0

        [app.Scat3D(slice,1)]=graphCircles3D(g(1,slice).Parent,Centers,Radii,slice,'r');
    end
end
%Find slices with scatter objects
    indices=find(isgraphics(app.Scat3D(:,1))==1);
%Find which scatter objects are plotted above the currently visible slices
invis=indices(indices>layer);
%Set the scatter objects to be invisible
set(app.Scat3D(invis,1),'Visible',0);

end