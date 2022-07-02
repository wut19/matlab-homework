clear all, close all, clc;

A = [0,1;-2,-3];
B = [1;2];
C = [0 0];
D = 0;
sys = ss(A,B,C,D);
P = [1,1;1,-1];
sys1 = ss2ss(sys,P);
sys1

