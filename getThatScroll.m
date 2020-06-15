function []=getThatScroll(obj,event,g,app)
on=findobj(g,'Visible',1);
off=findobj(g,'Visible',0);

if event.VerticalScrollCount>0 && size(on,1)>2
    len=size(on,1);
    on(len).Visible=0;
    on(len/2).Visible=0;
    if nargin==4
        s=size(on,1)/2;
        scat=findobj(app.Scat3D,'UserData',s);
        set(scat,'Visible',0);
    end
elseif event.VerticalScrollCount<0 && size(off,1)>0
    len=size(off,1);
    off(1).Visible=1;
    off(1+len/2).Visible=1;
    if nargin==4
        s=size(on,1)/2;
        scat=findobj(app.Scat3D,'UserData',s+1);
        set(scat,'Visible',1);
    end
end


end