clear all, close all, clc

s0 = [-4.2E7;0;0;4000];
tspan = [0,60*60*24*6];
[t,st] = ode23('myodefun',tspan,s0);
xt = st(:,1);
yt = st(:,2);
figure, hold on, box on;
plot(xt,yt,'k');
[XE,YE,ZE] = sphere(10);
RE = 6.378E6;
colormap([0,0,1]);
h = surf(RE*XE,RE*YE,0*ZE);
set(h,'EdgeColor',[0,0,1]);
axis('image');
set(gca,'FontSize',16);





