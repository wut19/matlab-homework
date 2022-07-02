figure;
subplot(3,2,1), box on, hold on;
plot(t,e1,'k-');
set(gca,'YLim',[-0.5,1.5],'XLim',[-1.5,1.5],'FontSize',16);
xlabel('t'); ylabel('e_1(t)');

subplot(3,2,2), box on, hold on;
plot(omg,real(E1),'k-');
set(gca,'YLim',[-0.5,1.5],'XLim',[-12*pi,12*pi],'FontSize',16);
xlabel('\omega'); ylabel('E_1(\omega)');

subplot(3,2,3), hold on, box on;
plot(t,real(r11),'k-');
set(gca,'YLim',[-0.5,1.5],'XLim',[-1.5,1.5],'FontSize',16);
xlabel('t'); ylabel('r_{1}(t)');

subplot(3,2,4), hold on, box on;
plot(omg,H1,'k-');
set(gca,'YLim',[-0.5,1.5],'XLim',[-12*pi,12*pi],'FontSize',16);
xlabel('\omega'); ylabel('H_1(\omega)');

subplot(3,2,5), hold on, box on;
plot(t,real(r12),'k-');
set(gca,'YLim',[-0.5,1.5],'XLim',[-1.5,1.5],'FontSize',16);
xlabel('t'); ylabel('r_{2}(t)');

subplot(3,2,6), hold on, box on;
plot(omg,H2,'k-');
set(gca,'YLim',[-0.5,1.5],'XLim',[-12*pi,12*pi],'FontSize',16);
xlabel('\omega'); ylabel('H_2(\omega)');
