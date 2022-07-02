figure;
t1 = linspace(-2,2,2*N-1)';
subplot(1,3,1), hold on, box on;
title('R_{11}(\tau)');
plot(t1,r1,'k-');
set(gca,'FontSize',16,'YLim',[-50,100]);
xlabel('\tau');

subplot(1,3,2), hold on, box on;
title('R_{22}(\tau)');
plot(t1,r2,'k-');
set(gca,'FontSize',16,'YLim',[-50,100]);
xlabel('\tau');

subplot(1,3,3), hold on, box on;
title('R_{33}(\tau)');
plot(t1,r3,'k-');
set(gca,'FontSize',16,'YLim',[-25,50]);
xlabel('\tau');
