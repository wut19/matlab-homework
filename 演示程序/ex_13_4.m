clear all, close all, clc;

[t,omg,FT,IFT] = prefourier([-1.5,1.5],1000,[-12*pi,12*pi],1000);
tau = 1;
e1 = (t>-tau/2 & t<tau/2);
E1 = FT*e1;
omgc1 = 4*pi;
H1 = (omg<omgc1 & omg>-omgc1);
omgc2 = 8*pi;
H2 = (omg<omgc2 & omg>-omgc2);
r11 = IFT*(E1.*H1);
r12 = IFT*(E1.*H2);
ex_13_4_plot();
