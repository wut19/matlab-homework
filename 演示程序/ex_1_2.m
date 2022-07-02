clear all, close all, clc;

syms t x y z1 z2 z3 z4 z5
x = sin(2*pi*t).*heaviside(t);
y = exp(-t).*heaviside(t);
z1 = 2*x;
z4 = x+y;
z5 = x.*y;
z2 = subs(x,t,t-0.5);
z3 = subs(x,t,2*t);

%x1 = subs(x,t,[-1:0.05:2]);