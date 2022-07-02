clear all, close all, clc;

[t,omg,FT,IFT] = prefourier([-20,20],600,[-10*pi,10*pi],600);
alpha = 1;
h = exp(-alpha*t).*(t>=0);
H = FT*h;
H1 = conj(hilbert(real(H)));
h1 = IFT*H1;
ex_13_5_plot();

