clear all, close all, clc;

b = [1,-2];
a1 = [1,0];
a2 = [1,1];
a = conv(conv(a1,a2),conv(a2,a2));
[r,p,k] = residue(b,a)