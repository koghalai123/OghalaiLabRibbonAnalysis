function [g]=graphFinal3D(axes,allData,startValue,stopValue,isTrans,app)

alpha=["none","scaled"];

allData2=allData;
%If app is an input argument, then make sure that the data has been
%brightness and contrast adjusted.
if exist('app')
    brightness=app.BrightnessSlider.Value;
    contrast=app.ContrastSlider.Value;
    if brightness ~=0 && contrast ~=0
        brightnessAdjusted=changeBrightness(brightness,allData/max(allData,[],'all'));
        allData2=changeContrast(contrast,brightnessAdjusted);
    end

end


g=gobjects();
%graph the slices as hgtransforms, because this allows them to be graphed
%at differen heights
for z=1:size(allData2,3)
  g(z) = hgtransform(axes,'Matrix',makehgtform('translate',[0 0 z]));
  image(g(z),allData2(:,:,z),'CDataMapping','scaled','AlphaDataMapping',alpha(isTrans+1)); %
  
end
view(3)

colormap('gray');
%Set limits for the axes so tha it doesnt change when scrolling through
%slices.
axes.XLim=[0,size(allData2,1)];
axes.YLim=[0,size(allData2,2)];
axes.ZLim=[0,size(allData2,3)];
end
%set(g(:).Parent.Parent,'Parent',a);