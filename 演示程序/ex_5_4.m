clear all, close all, clc;

b = [1,0,3];
a1 = [1,2,5];
a2 = [1,2];
a = conv(a1,a2);
[r,p,k] = residue(b,a)