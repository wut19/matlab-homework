clear all; close all; clc;

b = [1 -2 1];
a = [3 1 -6 1];
sys = tf(b,a);

sys2 = ss(sys);
A = sys2.A
B = get(sys2,'B')