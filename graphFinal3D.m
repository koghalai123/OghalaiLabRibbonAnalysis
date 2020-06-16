function [g]=graphFinal3D(axes,allData,startValue,stopValue,isTrans,app)

alpha=["none","scaled"];

allData2=allData;

if exist('app')
    brightness=app.BrightnessSlider.Value;
    contrast=app.ContrastSlider.Value;
    if brightness ~=0 && contrast ~=0
        brightnessAdjusted=changeBrightness(brightness,allData/max(allData,[],'all'));
        allData2=changeContrast(contrast,brightnessAdjusted);
    end

end


g=gobjects();
for z=1:size(allData2,3)
  g(z) = hgtransform(axes,'Matrix',makehgtform('translate',[0 0 z]));
  image(g(z),allData2(:,:,z),'CDataMapping','scaled','AlphaDataMapping',alpha(isTrans+1)); %
  
end
view(3)

colormap('gray');
axes.XLim=[0,size(allData2,1)];
axes.YLim=[0,size(allData2,2)];
axes.ZLim=[0,size(allData2,3)];
end
%set(g(:).Parent.Parent,'Parent',a);