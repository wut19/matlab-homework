clear all;

figure;
subplot(1,3,1), hold on, box on;
plot([0 0],[0 1],'k-',[0 2],[1 1],'k-',[2 2],[0 1],'k-');
set(gca,'XLim',[-1 3],'YLim',[-2,2],'FontSize',16);
xlabel('t');
ylabel('s_1(t)');

subplot(1,3,2), hold on, box on;
plot([0 0],[0 1],'k-',[0 1],[1 1],'k-',[1 1],[1 -1],'k-',[1 2],[-1 -1],'k-',[2 2],[-1 0],'k-');
set(gca,'XLim',[-1 3],'YLim',[-2,2],'FontSize',16);
xlabel('t');
ylabel('s_2(t)');

t = [0:0.001:2]';
s3 = sin(3*pi*t.^2);
subplot(1,3,3), hold on, box on;
plot(t,s3,'k-');
set(gca,'XLim',[-1 3],'YLim',[-2,2],'FontSize',16);
xlabel('t');
ylabel('s_3(t)');