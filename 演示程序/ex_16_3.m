clear all, close all, clc;

A = 1e5;
alpha = 1e3;
As = tf(A*alpha,[1 alpha]);
beta = 1e-4;
Fs = tf(beta,1);
Hs = feedback(As,Fs);
omg = logspace(0,5,100);
Aomg = freqs(As.num{:},As.den{:},omg);
Homg = freqs(Hs.num{:},Hs.den{:},omg);

t = 0:1e-5:5e-2;
x = .4*sin(1e3*t)+sin(1e4*t);
y1 = lsim(As,x,t);
y2 = lsim(Hs,x,t);

ex_16_3_plot();