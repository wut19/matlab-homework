clear all, close all, clc;

syms z;
X = z^2/(z^2-1.5*z+0.5);
x = iztrans(X)


a = [1, -1.5, 0.5];
b = 1;
[r, p, k] = residuez(b,a)