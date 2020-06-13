function [g]=graphFinal(axes,allData,startValue,stopValue)


g=gobjects();
for z=startValue:size(allData,3)-stopValue
  g(z) = hgtransform(axes,'Matrix',makehgtform('translate',[0 0 z]));
  image(g(z),allData(:,:,z),'CDataMapping','scaled');
  
end
view(3)
colormap('gray');
axes.XLim=[0,size(allData,1)];
axes.YLim=[0,size(allData,2)];
axes.ZLim=[0,size(allData,3)];
end
%set(g(:).Parent.Parent,'Parent',a);