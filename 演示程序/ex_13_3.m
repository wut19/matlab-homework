clear all, close all, clc;

[t,omg,FT,IFT] = prefourier([-3,3],1000,[-15,15],1000);
omgc = 10;
t0 = 1;
H_abs = ((omg<omgc)&(omg>-omgc));
H = H_abs.*exp(-j*t0*omg);
h = IFT*H;
ex_13_3_plot();
