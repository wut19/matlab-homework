clear all, close all, clc;

A = [-5,-1;3,-1];
B = [2;5];
C = [0 0];
D = 0;
sys = ss(A,B,C,D);
[sys1, P] = canon(sys,'model');
Q = [0,1;1,0];
sys2 = ss2ss(sys1, Q);
P
sys2.A
sys2.B


