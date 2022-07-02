clear all, close all, clc;

E = 1;
T1 = 1;
omg1 = 2*pi/T1;
N = 1000;
t = linspace(-T1/2,T1/2-T1/N,N)';
f = E*(t>-T1/4&t<T1/4) - E/2;
k1 = -10;
k2 = 10;
k = [k1:k2]';
F = 1/N*exp(-j*k*omg1*t.')*f;
a0 = F(11);
ak = F(12:21) + F(10:-1:1);
fs = cos(kron(t,[0:5]*omg1))*[a0;ak(1:5)];

ex_4_3_plot();
