clear all, close all, clc;

N = 100000;
w = randn(N, 1);
R = xcorr(w);
P = psd(w);
ex_14_2_plot();

