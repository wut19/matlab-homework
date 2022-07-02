clear all, close all, clc;

t0 = [-10:0.05:10]';
u0 = (t0>0);
x0 = sin(2*pi*t0).*u0;
y0 = exp(-t0).*u0;
tLim = [-1,2];

idx = (t0>=tLim(1)&t0<=tLim(2));
t = t0(idx);
x = x0(idx);
y = y0(idx);
z1 = 2*x;
z4 = x + y;
z5 = x.*y;

t2 = t0+0.5;
idx = (t2>=tLim(1)&t2<=tLim(2));
t2 = t2(idx);
z2 = x0(idx);

t3 = t0/2;
idx = (t3>=tLim(1)&t3<=tLim(2));
t3 = t3(idx);
z3 = x0(idx);
