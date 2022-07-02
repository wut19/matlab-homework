clear all, close all, clc;

[t,omg,FT,IFT] = prefourier([-1,1],500,[-25,25],500);
tau = 1;
E = 1;
g = sqrt(2*E/tau)*(t>-tau/4&t<tau/4);
f = E*(1-2*abs(t)/tau).*(t>-tau/2&t<tau/2);
G = FT*g;
F = FT*f;
Fe = G.*G;
fe = IFT*Fe;
ex_4_4_plot();
