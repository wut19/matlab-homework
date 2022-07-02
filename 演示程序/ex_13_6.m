clear all, close all, clc;

[t,omg,FT,IFT] = prefourier([0,5],1000,[-250,250],1000);
g = 3*cos(10*t)+2*cos(20*t);
f = g.*cos(100*t);
g0 = f.*cos(100*t);
G0 = FT*g0;
H = (omg<30&omg>-30);
G1 = G0.*H;
g1 = IFT*G1;
G = FT*g;
F = FT*f;

ex_13_6_plot();
