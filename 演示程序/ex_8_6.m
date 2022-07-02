clear all, close all, clc;

a1 = 1.1; a2 = -0.7; b1 = 1;
a = [1, -a1, -a2];
b = [0, b1];
figure;
subplot(2,1,1), zplane(b,a);
subplot(2,1,2), impz(b,a);
figure, freqz(b,a);
