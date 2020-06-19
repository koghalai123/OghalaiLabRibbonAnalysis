function [brightnessAdjusted]=changeBrightness(brightness,data)
    brightnessAdjusted=min(data+brightness,1);
end