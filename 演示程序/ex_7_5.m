clear all, close all, clc;

n = [0:20]';
x = [1;0.5];
y = 0.5.^n;
[h,r] = deconv(y,x);
h0 = 0.5.^n.*(mod(n,2)==0);
ex_7_5_plot();