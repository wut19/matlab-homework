clear all, close all, clc;

syms t x
x = heaviside(t)-heaviside(t-10);
Fx = fourier(x);
omg = [-3*pi:0.02:3*pi];
Fx1 = double(subs(Fx,'w',omg));
Lx = laplace(x);
sgm = [0:0.05:1];
re = repmat(sgm,length(omg),1);
im = repmat(omg',1,length(sgm));
s1 = re + i*im;
Lx1 = double(subs(Lx,'s',s1));
figure, box on, hold on, grid on;
surf(sgm,omg,real(Lx1),'LineStyle','none');
plot3(0*omg,omg,real(Fx1),'k','LineWidth',2);
xlabel('\sigma','FontSize',14);
ylabel('\omega','FontSize',14);
zlabel('L(x) & F(x)','FontSize',14);
set(gca,'FontSize',14);
set(gca,'XTick',[0:0.5:1],'YTick',[-2*pi:pi:2*pi]);
set(gca,'YTickLabel',{'-2pi';'-pi';'0';'pi  ';'2pi '});

