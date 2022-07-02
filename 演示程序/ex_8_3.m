clear all, close all, clc;

syms a b z;
X = z/(z-a);
Y = (X+2*b)/(1-b*z^(-1));
y1 = iztrans(Y);
y = simplify(y1)