clear all, close all, clc;

N = 1000;
KEEP = 50;
[t,omg,FT,IFT] = prefourier([-5,5],N,[-10*pi,10*pi],1000);

G = tripuls(omg/5);
g = IFT*G;
gtemp = 0*g;
gtemp(1:KEEP:N) = g(1:KEEP:N);
g1 = filter(ones(1,KEEP),1,gtemp);
G1 = FT*g1;
ex_13_9_plot();
