function [IDX,pairs]=findPairs(ribbonData1,ribbonData2,radius)
%radius=30
[IDX,pairs]=rangesearch([ribbonData1(:,1),ribbonData1(:,2),ribbonData1(:,3)],[ribbonData2(:,1),ribbonData2(:,2),ribbonData2(:,3)],radius);
end