function [brightnessAdjusted]=changeBrightness(brightness,data)
% 
% [brightnessAdjusted]=changeBrightness(brightness,data)
%   changeBrightness adds intensity to everything to make it easier to see
% 
%   brightnessAdjusted is the data after having the brightness adjusted
%
%   brightness is how much the data should get brighter
%   data is the data that is having hte intensity changed



    brightnessAdjusted=min(data+brightness,1);
end