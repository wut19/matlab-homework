clear all;clc;
M = 10;
N = 15;
T = 8;
sim = 1;
profile on
wxh(M,N,sim);
fastwxh(M,N,T,sim);
profile viewer

