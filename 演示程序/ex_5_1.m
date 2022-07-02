clear all, close all, clc;

syms t w
F1 = laplace(t^3)
F2 = laplace(sin(w*t))