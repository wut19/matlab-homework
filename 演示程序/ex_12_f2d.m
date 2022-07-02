clear all, close all, clc

syms t x n w
xt = heaviside(t)-heaviside(t-10);
Fx = fourier(xt);
w1 = [-3*pi:0.02:3*pi];
Fx1 = double(subs(Fx,'w',w1));
xn = heaviside(n) - heaviside(n-10);
Zxn = ztrans(xn);
DTFTx = subs(Zxn,'z',exp(j*w));
DTFTx1 = double(subs(DTFTx,'w',w1));

figure;
subplot(1,2,1), box on, hold on, grid on;
plot3(cos(w1),sin(w1),real(Fx1));
zlabel('F(x)','FontSize',14);
set(gca,'FontSize',14);
set(gca,'XLim',[-1.5,1.5],'YLim',[-1.5,1.5]);
subplot(1,2,2), box on, hold on, grid on;
plot3(cos(w1),sin(w1),real(DTFTx1));
zlabel('L(x)','FontSize',14);
set(gca,'FontSize',14);
set(gca,'XLim',[-1.5,1.5],'YLim',[-1.5,1.5]);

