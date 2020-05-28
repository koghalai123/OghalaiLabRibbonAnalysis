function []=graphRibbon(UIAxes4,UIAxes5,UIAxes6,ribbon,newData,scaledData)


imshow(newData,'parent',UIAxes4);
axis(UIAxes4,'equal');

imshow(scaledData,'parent',UIAxes5);
axis(UIAxes5,'equal');

imshow(scaledData,'parent',UIAxes6);
axis(UIAxes6,'equal');


hold(UIAxes4,'on');
hold(UIAxes6,'on');
theta=linspace(0,2*pi,8);
for j = 1:size(ribbon,1)
    plot(UIAxes4,10*cos(theta)+ribbon(j,1)/.0495,10*sin(theta)+(ribbon(j,2))/.0495);
    plot(UIAxes6,10*cos(theta)+ribbon(j,1)/.0495,10*sin(theta)+(ribbon(j,2))/.0495);
end

hold(UIAxes4,'off');
hold(UIAxes6,'off');