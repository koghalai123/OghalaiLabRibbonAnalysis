function addToScatter(app,S,g,layer)


delete(app.Scat3D);
app.Scat3D=gobjects();
for slice=1:sum(isgraphics(g))

    [Radii,Centers,~,~]=findStats(app,str2double(app.CheckThatDataDropDown.Value),slice);

    if size(Centers,1)>0

        [app.Scat3D(slice,1)]=graphCircles3D(g(1,slice).Parent,Centers,Radii,slice,'r');
    end
end

    indices=find(isgraphics(app.Scat3D(:,1))==1);

invis=indices(indices>layer);

set(app.Scat3D(invis,1),'Visible',0);

end