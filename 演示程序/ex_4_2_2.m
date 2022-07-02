clear all, close all, clc;

T = 2;
N = 2000;
t = linspace(-T/2,T/2-T/N,N)';
f = (t>-1/2&t<1/2);
OMG = 16*pi;
K = 1000;
omg = linspace(-OMG/2,OMG/2-OMG/K,K)';
F = zeros(size(omg));
for k = 1:K
    F(k) = T/N*exp(-j*omg(k)*t).'*f;
end
fs = zeros(size(t));
for n = 1:N
    fs(n) = OMG/2/pi/K*exp(j*omg*t(n)).'*F;
end

ex_4_2_plot();
