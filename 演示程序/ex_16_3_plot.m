figure;
subplot(3,1,1), box on, hold on;
plot(t,x,'k');
set(gca,'FontSize',16);
ylabel('x(t)');
subplot(3,1,2), box on, hold on;
plot(t,y1,'k');
set(gca,'FontSize',16);
ylabel('y_1(t)');
subplot(3,1,3), box on, hold on;
plot(t,y2,'k');
set(gca,'FontSize',16);
ylabel('y_2(t)');
xlabel('x(t)');

figure, box on, hold on;
plot(omg,abs(Aomg),'k');
plot(omg,abs(Homg),'k--');
set(gca,'YScale','log','XScale','log','FontSize',16);
set(gca,'YLim',[5e2,3e5],'XTick',10.^[0:5]);
legend('|A(j\omega)|','|H(j\omega)|');
xlabel('Frequency');


