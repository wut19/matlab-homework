clear all, close all, clc;

sys = tf(10,[1 1]);
t = [0:0.01:10]';
e = sin(3*t);
i = lsim(sys, e, t);
ex_5_6_plot();

