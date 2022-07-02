clear all, close, clc

syms z1 w n
z1 = ztrans(sin(n),w);
X = [-3:0.05:3];
Y = [-3:0.05:3];
Z = double(subs(z1,'w',log(kron(exp(X),exp(j*Y')))));

figure; hold on; grid off; axis off; box off;
colormap(hot);
surf(X,Y,real(Z),'linestyle','none');
W = 4;
set(gca,'XLim',[-W W],'YLim',[-W W],'ZLim',[-W W]);
set(gca,'XTick',[],'YTick',[],'ZTick',[]);

R = 3;
ele = 60;
x = 0;
y = 0;
z = R*sin(ele*2*pi/360);
[sx sy sz] = sphere(30);
hsun = surf(x+0.5*sx,y+0.5*sy,z+0.5*sz,10*ones(size(sz)));
set(hsun,'LineStyle','none');
hlight = lightangle(0,60);
set(hlight,'Color',[1 1 0.5]);
for n = 0:5:720
    lightangle(hlight,n,60);
    view(-0.1*n,40-40*n/720);
    x = R*cos(ele*2*pi/360)*cos((n)*2*pi/360);
    y = R*cos(ele*2*pi/360)*sin((n)*2*pi/360);
    set(hsun,'XData',x+0.5*sx,'YData',y+0.5*sy,'ZData',z+0.5*sz);
    pause(0.05);
end
