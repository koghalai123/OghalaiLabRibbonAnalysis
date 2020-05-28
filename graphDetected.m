function []=graphDetected(UIAxes4,UIAxes5,UIAxes6,newCenters,mu,ribbon,data,sliceNumber,nucleusSlice,r1,r2,scaledData,range1,range2,startSlice,sortedBySliceA,sortedBySliceB)



theta=linspace(0,2*pi,10);

view(2);








hold(UIAxes4,'on');
image(UIAxes4,scaledDara)
for j = 1:size(sortedBySliceB,1)
    if round(sortedBySliceB(j,3)/.26)==sliceNumber
        plot(UIAxes4,(sortedBySliceB(j,1)+sortedBySliceB(j,4)*cos(theta))/.0495,(sortedBySliceB(j,2)+sortedBySliceB(j,4)*sin(theta))/.0495);
    end
end
hold(UIAxes4,'off');
axis(UIAxes4,'equal');



hold(UIAxes5,'on');
image(UIAxes5,scaledData);
hold(UIAxes5,'off');
axis(UIAxes5,'equal');



hold(UIAxes6,'on');
currentSlice2=image(UIAxes6,scaledData);
for j = 1:size(sortedBySliceB,1)
    if round(sortedBySliceB(j,3)/.26)==sliceNumber
        plot(UIAxes6,(sortedBySliceB(j,1)+sortedBySliceB(j,4)*cos(theta))/.0495,(sortedBySliceB(j,2)+sortedBySliceB(j,4)*sin(theta))/.0495);
    end
end
hold(UIAxes6,'off');
axis(UIAxes6,'equal');
end