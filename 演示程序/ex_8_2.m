clear all, close all, clc;

syms n a b z;
x = a^n; %注意不能乘以heaviside(n)，因为n=0时定义为1/2
X = ztrans(x);
H = 1/(1-b*z^(-1));
Y = H*X;
y1 = iztrans(Y);
y = simplify(y1)