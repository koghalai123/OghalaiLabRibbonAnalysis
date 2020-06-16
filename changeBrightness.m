function [brightnessAdjusted]=changeBrightness(brightness,data)
for i=1:size(data,3)
    brightnessAdjusted=min(data+brightness,1);
end
end