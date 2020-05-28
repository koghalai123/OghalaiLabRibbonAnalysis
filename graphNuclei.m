function []=graphNuclei(UIAxes4,UIAxes5,UIAxes6,newCenters,mu,newData,sliceNumber,scaledData)






imshow(scaledData,'parent',UIAxes6);
axis(UIAxes6,'equal');

imshow(newData,'parent',UIAxes4);
axis(UIAxes4,'equal');

imshow(scaledData,'parent',UIAxes5);
axis(UIAxes5,'equal');


hold(UIAxes4,'on');
hold(UIAxes6,'on');

theta=linspace(0,2*pi,40);
for j = 1:size(circles,1)
    plot(UIAxes4,(circles(j,1)+circles(j,3)*cos(theta))/.0495,(circles(j,2)+circles(j,3)*sin(theta))/.0495);
    plot(UIAxes6,(circles(j,1)+circles(j,3)*cos(theta))/.0495,(circles(j,2)+circles(j,3)*sin(theta))/.0495);
end
hold(UIAxes4,'off');
hold(UIAxes6,'off');


end