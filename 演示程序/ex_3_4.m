clear all, close all, clc;

a = [1, 2, 3];
b = [1, 1];
sys = tf(b,a);
t = [0:0.1:10]';
e1 = t.^2;
r1 = lsim(sys,e1,t);
e2 = exp(t);
r2 = lsim(sys,e2,t);
ex_3_4_plot();