clear all, close all, clc;

[t,omg,FT,IFT] = prefourier([-1,2],300,[-50,50],100);
tau = 0.5;
v1 = (t>0&t<tau);
R = 1; C = 0.3;
alpha = 1/R/C;
H = alpha./(alpha+j*omg);

V1 = FT*v1;
V2 = V1.*H;

h = IFT*H;
v2 = IFT*V2;
ex_13_1_plot();
