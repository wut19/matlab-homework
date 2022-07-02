clear all, close all, clc;

T = 60;
N = 1000;
OMG1 = 50;
REP = 29;
[t,omg,FT,IFT] = prefourier([-T/2,T/2],N,[-REP/2,REP/2],REP*OMG1);

G = tripuls(omg);
g = IFT*G;
temp = 0*G;
temp(1:OMG1:REP*OMG1) = 1;
G1 = filter(G(G>0),1,temp);
g1 = IFT*G1;
g2 = 0*g;
g2(1:3*N/T:N) = g(1:3*N/T:N);
G2 = FT*g2;
ex_13_8_plot();