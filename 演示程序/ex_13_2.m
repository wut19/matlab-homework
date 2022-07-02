clear all;

[b, a] = butter(5, 0.3);
grpdelay(b, a, 128);

n = 0:30;
x = sin(0.2*pi*n);
y = filter(b,a,x);
ex_13_2_plot();

