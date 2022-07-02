
figure;
subplot(1,2,1), hold on, box on;
plot(t,real(g),'k-',t,real(g1),'k:');
set(gca,'FontSize',16);
xlabel('t');
ylabel('f(t)');
legend('f(t)','f_1(t)');

subplot(1,2,2), hold on, box on;
plot(omg,real(G),'k-',omg,real(G1),'k:');
set(gca,'FontSize',16,'XLim',[-10*pi,10*pi],'YLim',[-0.1,1.1]);
xlabel('\omega')
ylabel('F(\omega)');
legend('F(\omega)','F_1(\omega)');
