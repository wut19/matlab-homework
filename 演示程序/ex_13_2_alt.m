clear all, close all, clc;

N = 1000;
K = 1000;
OMG = 100;
T = 6;
tau = 1;
t = linspace(-1,5-T/N,N)';
omg = linspace(-OMG/2,OMG/2-OMG/K,K)';
FT = T/N*exp(-j*kron(omg,t.'));
IFT = OMG/2/pi/K*exp(j*kron(t,omg.'));
H1 = exp(j*(-1.5*omg));
H2 = exp(j*(-50-sign(omg).*sqrt(abs(omg))));
x = (t >= 0 & t < tau);
X = FT*x;
y1 = IFT*(X.*H1);
y2 = IFT*(X.*H2);
ex_13_2_alt_plot1();


x1 = (t >= 0 & t < tau).*sin(2*pi*t);
x2 = (t >= 0 & t < tau).*sin(4*pi*t);
% x1 = sin(2*pi*t);
% x2 = sin(4*pi*t);
X1 = FT*x1;
X2 = FT*x2;
y11 = IFT*(X1.*H1);
y12 = IFT*(X1.*H2);
y21 = IFT*(X2.*H1);
y22 = IFT*(X2.*H2);
ex_13_2_alt_plot2();
