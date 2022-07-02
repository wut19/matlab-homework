clear all, close all, clc;

T = 4;
N = 1000;
[t,omg,FT,IFT] = prefourier([-T/2,T/2],N,[-16*pi,16*pi],1000);

f1 = (t>=0&t<1);
f2 = (t>=0&t<1).*(1-t);
xtemp = T/N*conv(f1,f2);
x = xtemp(N/2:N/2+N-1);
ytemp = T/N*xcorr(f1,f2);
y = ytemp(N/2:N/2+N-1);

x1 = IFT*((FT*f1).*(FT*f2));
y1 = IFT*((FT*f1).*conj(FT*f2));

ex_14_1_plot();



