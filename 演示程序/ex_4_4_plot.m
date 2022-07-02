figure;
subplot(2,2,1), hold on, box on;
plot(t,f,'k-');
set(gca,'FontSize',16);
set(gca,'YLim',[-0.2,1.5]);
xlabel('Time(sec)');
legend('f(t)');
subplot(2,2,2), hold on, box on;
plot(omg,real(F),'k-');
set(gca,'FontSize',16);
set(gca,'YLim',[0,0.8]);
xlabel('Frequency');
legend('F(\omega)');

subplot(2,2,3), hold on, box on;
plot(t,g,'k-.',t,real(fe),'k-');
set(gca,'FontSize',16);
set(gca,'YLim',[-0.2,0.8]*2);
xlabel('Time(sec)');
legend('g(t)','f_e(t)');
subplot(2,2,4), hold on, box on;
plot(omg,real(G),'k-.');
plot(omg,real(Fe),'k-');
set(gca,'FontSize',16);
set(gca,'YLim',[-0.2,0.8],'XLim',[-25,25]);
xlabel('Frequency');
legend('G(\omega)','F_e(\omega)');

