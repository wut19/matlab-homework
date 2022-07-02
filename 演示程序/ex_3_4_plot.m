figure;
subplot(1,2,1), hold on, box on;
set(gca,'YScale','log');
set(gca,'FontSize',16);
plot(t,e1,'k-',t,e2,'k-.');
legend('e_1','e_2');
xlabel('time');
ylabel('input');

subplot(1,2,2), hold on, box on;
set(gca,'YScale','log');
set(gca,'FontSize',16);
plot(t,r1,'k-',t,r2,'k-.');
legend('r_1','r_2');
xlabel('time');
ylabel('output');
