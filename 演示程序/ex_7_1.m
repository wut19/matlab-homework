clear all, close all, clc;

a = [1, -1, 0.24];
b = [1, -1];
n = [0:20]';
x = n.^2;
wi = [-a(3)*(-2)-a(2)*(-1),-a(3)*(-1)];
[y, wf] = filter(b, a, x, wi);
ex_7_1_plot();  
