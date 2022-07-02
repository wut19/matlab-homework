clear all, close all, clc;

t = [-1:0.01:4]';
e = (t>-1/2&t<1);
h = (t>0&t<2).*t/2;
[r1,t1] = conv1(e,t,h,t);
tr = t1(t1>=-1&t1<=4);
r = r1(t1>=-1&t1<=4);
ex_3_8_plot();
