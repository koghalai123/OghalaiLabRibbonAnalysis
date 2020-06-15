function addToScatter(app,S,g,layer)


delete(app.Scat3D);
app.Scat3D=gobjects();
for slice=0:size(g,2)-1

    [Radii,Centers,~,~]=findStats(app,str2double(app.CheckThatDataDropDown.Value),slice+app.FirstSliceEditField.Value);

    if size(Centers,1)>0

        [app.Scat3D(slice+app.FirstSliceEditField.Value,1)]=graphCircles3D(g(1,slice+app.FirstSliceEditField.Value).Parent,Centers,Radii,slice,'r');
    end
end


minimum=find(isgraphics(S),1);
if layer<minimum
    layer=minimum;
end
maximum=size(isgraphics(S),1);

set(app.Scat3D(layer+2:maximum,1),'Visible',0);

end