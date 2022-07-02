figure;
subplot(3,2,1), hold on, box on;
plot(t, real(h), 'k-');
set(gca,'YLim',[-1,4],'XLim',[-1,2],'FontSize',16);
xlabel('t');
ylabel('h(t)');

subplot(3,2,2), hold on, box on;
plot(omg, abs(H),'k-');
set(gca,'YLim',[0,1],'FontSize',16);
xlabel('\omega');
ylabel('|H(\omega)|');

subplot(3,2,3), hold on, box on;
plot(t, v1, 'k-');
set(gca,'FontSize',16);
axis([-1 2 -0.5 1.5]);
xlabel('t');
ylabel('v_1(t)');

subplot(3,2,4), hold on, box on;
plot(omg,abs(V1),'k-'); %axis tight;
set(gca,'YLim',[0 1],'FontSize',16);
xlabel('\omega');
ylabel('|V_1(\omega)|');

subplot(3,2,5), hold on, box on; 
plot(t, real(v2),'k-');
set(gca,'YLim',[-0.5 1.5],'XLim',[-1,2],'FontSize', 16);
xlabel('t');
ylabel('v_2(t)');

subplot(3,2,6), hold on, box on;
plot(omg,abs(V2),'k-'); %axis tight;
set(gca,'YLim',[0 1],'FontSize',16);
xlabel('\omega');
ylabel('|V_2(\omega)|');

