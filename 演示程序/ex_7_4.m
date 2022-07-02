clear all, close all, clc;

a = 0.8;
N = 6;
n = [0:20]';
h = (a.^n);
x = (n>=0&n<N);
yc = conv(h, double(x));
yf1 = filter(h, 1, x);
yf2 = filter(x, 1, h);
yf3 = filter(1,[1, -a], x);
disp('Îó²î·Ö±ðÎª');
disp(sum(abs([yf1-yf2,yf1-yf3,yf2-yf3])));
ex_7_4_plot();

