clear all, close all, clc;

syms n
x1 = (1/2)^n;
X1 = ztrans(x1)
x2 = n*(n-1)/2;
X2 = ztrans(x2)
X2s = simplify(X2)