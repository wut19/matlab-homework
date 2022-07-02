clear all, close all, clc;

a = [1, -0.5, 0.6];
b = [1, 0, -0.3];
n = [0:20]';
[hi, t] = impz(b,a,n);
x = (n == 0);
hf = filter(b,a,x);
ex_7_3_plot();
