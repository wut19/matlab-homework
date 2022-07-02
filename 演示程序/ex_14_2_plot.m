figure;
subplot(3,1,1), hold on, box on;
plot([1:N]/N,w,'k-');
set(gca,'FontSize',16);
xlabel('t');
ylabel('w_N(t)');

subplot(3,1,2), hold on, box on;
plot([-N+1:N-1]/N,R,'k');
set(gca,'FontSize',16);
xlabel('\tau');
ylabel('R_N(\tau)');

subplot(3,1,3), hold on, box on;
plot(abs(P),'k');
set(gca,'FontSize',16);
xlabel('\omega');
ylabel('P_N(\omega)');
axis([0,length(P),0,1.5]);
