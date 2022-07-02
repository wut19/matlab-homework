clear all, close all, clc;

a = [-2, 0, -1; 0, -3, 3; 2, -2, 0];
b = [1, 0; 0, -3; 0, 0];
c = [0, 1, 0];
d = [0, 1];
sys = ss(a, b, c, d)