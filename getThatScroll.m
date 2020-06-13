function []=getThatScroll(obj,event,g)
on=findobj(g,'Visible',1);
off=findobj(g,'Visible',0);

if event.VerticalScrollCount>0 && size(on,1)>2
    len=size(on,1);
    on(len).Visible=0;
    on(len/2).Visible=0;
elseif event.VerticalScrollCount<0 && size(off,1)>0
    len=size(off,1);
    off(1).Visible=1;
    off(1+len/2).Visible=1;
end


end