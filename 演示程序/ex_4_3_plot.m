figure;
subplot(1,2,1), hold on, box on;
plot(t,f,'k-');
plot(t,fs,'k--');
plot(t,ak(1)*cos(omg1*t),'k-.');
plot(t,ak(3)*cos(3*omg1*t),'k:');
plot(t,ak(5)*cos(5*omg1*t),'k:');
legend('f(t)','f_s(t)','f_1(t)',...
    'f_3(t)','f_5(t)');
set(gca,'YLim',[-1, 1.5],'FontSize',16);
xlabel('t');
ylabel('f(t)');
subplot(1,2,2), hold on, box on;
stem([0:10],[a0;ak],'k');
set(gca,'FontSize',16);
xlabel('k');
ylabel('a_k');