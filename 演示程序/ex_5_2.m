clear all, close all, clc;

syms s;
f = ilaplace(10*(s+2)*(s+5)/s/(s+1)/(s+3))