function addRibbon(obj,event,g,app)
ax=obj.CurrentAxes;
ax_max_x = ax.InnerPosition(1) + ax.InnerPosition(3); % max mouse X pos inside axis
ax_max_y = ax.InnerPosition(2) + ax.InnerPosition(4); % max mouse Y pos inside axis
% Determines if the user clicked on the UIAxes
if strcmpi(obj.SelectionType, 'open') % if it is a double-click event
    if str2double(app.CheckThatDataDropDown.Value)==1 
    elseif str2double(app.CheckThatDataDropDown.Value)==2 || str2double(app.CheckThatDataDropDown.Value)==3
        on=size(findobj(g,'Visible',1),1);
        en=size(app.ribbon(str2double(app.CheckThatDataDropDown.Value)-1).grouped,2);
        [ans1,ans2]=(arrayfun(@(s) size(s.grouped),app.ribbon(str2double(app.CheckThatDataDropDown.Value)-1).grouped));
        ans3=round(sum(ans1)/(2*en));
        low=(on/2-ans3-1);
        high=(on/2+ans3+1);
        if low <1
            low=1;
        elseif high>size(g,2)
            high=size(g,2);
        end
        t2=transpose([low:high]);
        temp=[ones(size(t2,1),1)*ax.CurrentPoint(1,1),ones(size(t2,1),1)*ax.CurrentPoint(1,2),t2,(en+1)*ones(size(t2,1),1)];
        app.ribbon(str2double(app.CheckThatDataDropDown.Value)-1).grouped(en+1).grouped=temp;
        [app.presynapticPositions,app.postsynapticPositions]=ClusteredToSlice(app.ribbon,app.dimensions);
        addToScatter(app,app.Scat3D,g,on/2);
        indices=find(isgraphics(app.Scat3D(:,1))==1);
        set(app.Scat3D(indices,1),'ButtonDownFcn',{@removeRibbon,app,g});
    end
end

end