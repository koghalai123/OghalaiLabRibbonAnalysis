function addRibbon(obj,event,g,app)
ax=obj.CurrentAxes;

% Determines if the user clicked on the UIAxes
if strcmpi(obj.SelectionType, 'open') % if it is a double-click event
    if str2double(app.CheckThatDataDropDown.Value)==1 %check which channel is being displayed
    elseif str2double(app.CheckThatDataDropDown.Value)==2 || str2double(app.CheckThatDataDropDown.Value)==3
        %find the number of visible slices
        on=size(findobj(g,'Visible',1),1);
        %Find the number of ribbons in the set that is being looked at
        en=size(app.ribbon(str2double(app.CheckThatDataDropDown.Value)-1).grouped,2);
        %Find the sizes of each of the ribbons and store as array
        [ans1]=(arrayfun(@(s) size(s.grouped,1),app.ribbon(str2double(app.CheckThatDataDropDown.Value)-1).grouped));
        %Use the sizes of the ribbons in the array to determins a representative ribbon size
        ans3=round(sum(ans1)/(2*en));
        low=(on/2-ans3-1); %Determine how many slices above and below the targeted slice should also be included in the ribbon
        high=(on/2+ans3+1); 
        if low <1 %Make sure that the slices above/below the targeted slice are viable. If you are too close to the end of the slice stack, the minimums are automatically adjusted
            low=1;
        elseif high>size(g,2)
            high=size(g,2);
        end
        
        
        t2=transpose([low:high]);
        %Create a matrix to store this ribbon data
        temp=[ones(size(t2,1),1)*ax.CurrentPoint(1,1),ones(size(t2,1),1)*ax.CurrentPoint(1,2),t2,(en+1)*ones(size(t2,1),1)];
        %add the new ribbon to the ribbon struct
        app.ribbon(str2double(app.CheckThatDataDropDown.Value)-1).grouped(en+1).grouped=temp;
        %update the ribbon locations(sorted by slice, rather than it's group)
        [app.presynapticPositions,app.postsynapticPositions]=ClusteredToSlice(app.ribbon,app.dimensions);
        %Regraph the ribbons
        addToScatter(app,app.Scat3D,g,on/2);
        %find the slices that have ribbons plotted on them
        indices=find(isgraphics(app.Scat3D(:,1))==1);
        %set the callback for all the new ribbons
        set(app.Scat3D(indices,1),'ButtonDownFcn',{@removeRibbon,app,g});
    end
end

end