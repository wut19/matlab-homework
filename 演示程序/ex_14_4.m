close all;
ex_14_4_block();
clear all, clc;

N = 100;
t = linspace(0,2,N)';
s1 = (t>=0&t<=2);
s2 = ((t>=0&t<1)-(t>=1&t<2));
s3 = sin(3*pi*t.^2);
r1 = xcorr(s1);
r2 = xcorr(s2);
r3 = xcorr(s3);

ex_14_4_plot();
