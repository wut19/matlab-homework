clear all, close all, clc;

b = [1,5,9,7];
a1 = [1,1];
a2 = [1,2];
a = conv(a1,a2);
[r,p,k] = residue(b,a)