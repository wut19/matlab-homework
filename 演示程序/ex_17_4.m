clear all, close all, clc;

txt = ['不完全可观';'完全可观 '];
A = [1,1;-2,-1];
C = [1,0];
N = obsv(A,C);
n = rank(N);
disp(['系统1',txt(1+(n==2),:)]);

