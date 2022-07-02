clear all, close all, clc;

syms n x w
x = heaviside(n) - heaviside(n-10);
Zx = ztrans(x);
DTFTx = subs(Zx,'z',exp(j*w));
r = [0.02:0.02:1.5];
w1 = [0.02:0.02:2*pi+0.04];
z1 = kron(r,exp(j*w1)');
Zx1 = double(subs(Zx,'z',z1)); 
DTFTx1 = double(subs(DTFTx,'w',w1));
figure, box on, hold on, grid on;
Zx2 = max(min(real(Zx1),20),-5);
DTFTx2 = max(min(real(DTFTx1),20),-5);
surf(real(z1),imag(z1),Zx2,'linestyle','none');
plot3(cos(w1),sin(w1),DTFTx2,'k','LineWidth',2);
xlabel('z_{real}','FontSize',14);
ylabel('z_{imag}','FontSize',14);
zlabel('z(x) & DTFT(x)','FontSize',14);
set(gca,'FontSize',14);
set(gca,'XLim',[-1.5,1.5],'YLim',[-1.5,1.5]);
view(71,26);
