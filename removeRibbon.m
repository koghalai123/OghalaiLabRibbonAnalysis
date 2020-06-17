function removeRibbon(obj,event,app,g)
if event.Button==3
    layer=obj.ZData(1,1);
    if str2double(app.CheckThatDataDropDown.Value)==2
        points=app.presynapticPositions(event.IntersectionPoint(1,3)).points;
    elseif str2double(app.CheckThatDataDropDown.Value)==3
        points=app.postsynapticPositions(event.IntersectionPoint(1,3)).points;
    end
    
    dist=((event.IntersectionPoint(1,1)-points(:,1)).^2)+((event.IntersectionPoint(1,2)-points(:,2)).^2);
    [~,I]=min(dist);
    group=points(I,4);
    
    le=size(app.Scat3D,1);
    p=app.Scat3D(find(isgraphics(app.Scat3D),1)).Parent;

    
    
    
    stor=find(cell2mat((arrayfun(@(a) mean(a.grouped(:,4))==group,app.ribbon(str2double(app.CheckThatDataDropDown.Value)-1).grouped,'UniformOutput',false))));
    app.ribbon(str2double(app.CheckThatDataDropDown.Value)-1).grouped(stor)=[];
    delete(app.Scat3D);
    app.Scat3D=gobjects();
    [app.presynapticPositions,app.postsynapticPositions]=ClusteredToSlice(app.ribbon,app.dimensions);

    for slice=1:sum(isgraphics(g))
        [Radii,Centers,~,~]=findStats(app,str2double(app.CheckThatDataDropDown.Value),slice);

        if size(Centers,1)>0

            [app.Scat3D(slice,1)]=graphCircles3D(p,Centers,Radii,slice,'r');
        end
    end
    indices=find(isgraphics(app.Scat3D(:,1))==1);
    set(app.Scat3D(indices,1),'ButtonDownFcn',{@removeRibbon,app,g});
    
    
    invis=indices(indices>layer);

    set(app.Scat3D(invis,1),'Visible',0);
    
    
end

end