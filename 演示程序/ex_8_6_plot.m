figure;

subplot(2,2,1), hold on, box on;
plot(t,f,'k-');
plot(t,fs,'k-.');
set(gca,'YLim',[-.5 1.5],'FontSize',16);
xlabel('t');
ylabel('f(t)');
legend('f(t)','f_s(t)');

subplot(2,2,2), hold on, box on;
plot(omg,real(F),'k-');
set(gca,'XLim',[-OMG/2,OMG/2],'YLim',[-0.5 1.5],'FontSize',16);
xlabel('\omega');
ylabel('F(\omega)');

subplot(2,2,3), hold on, box on;
plot(t,f,'k-');
plot(t,f_ifft,'k-.');
set(gca,'YLim',[-.5 1.5],'FontSize',16);
xlabel('t');
ylabel('f(t)');
legend('f(t)','f_{ifft}(t)');

subplot(2,2,4), hold on, box on;
plot(omg,real(F_fft),'k-');
set(gca,'XLim',[-OMG/2,OMG/2],'YLim',[-0.5 1.5],'FontSize',16);
xlabel('\omega');
ylabel('F_{fft}(\omega)');
