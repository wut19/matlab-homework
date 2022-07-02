close all,clear all,clc;
t = [0:0.000125:1].';

figure;
% f = 200Hz
x1 = (mod(t,0.005)==0);
x1 = double(x1);
sound(x1);
subplot(2,1,1);
plot(x1);
pause(2);
% f = 300Hz
x2 = (mod(t,1/300)<(0.00125));
x2 = double(x2);
sound(x2);
subplot(2,1,2);
plot(x2);