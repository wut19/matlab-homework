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
    for n = 1:N
        F(k) = F(k) + T/N*f(n)*exp(-j*omg(k)*t(n));
    end
end
fs = zeros(size(t));
for n = 1:N
    for k = 1:K
        fs(n) = fs(n) + OMG/2/pi/K*F(k)*exp(j*omg(k)*t(n));
    end
end

ex_4_2_plot();
