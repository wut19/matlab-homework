figure;

subplot(1,3,1), hold on, box on;
stem(n,yzs(:,1),'k');
set(gca,'FontSize',14,'XLim',[0,20],'YLim',[-0.5,1.01]);
xlabel('n');
ylabel('y_{zs}^{(1)}(n)');

subplot(1,3,2), hold on, box on;
stem(n,yzi(:,1),'k');
set(gca,'FontSize',14,'XLim',[0,20],'YLim',[-0.5,1.01]);
xlabel('n');
ylabel('y_{zi}^{(1)}(n)');

subplot(1,3,3), hold on, box on;
stem(n,y(:,1),'k');
set(gca,'FontSize',14,'XLim',[0,20],'YLim',[-0.5,1.01]);
xlabel('n');
ylabel('y^{(1)}(n)');

figure;

subplot(1,3,1), hold on, box on;
stem(n,yzs(:,2),'k');
set(gca,'FontSize',14,'XLim',[0,20],'YLim',[-0.5,1.01]);
xlabel('n');
ylabel('y_{zs}^{(2)}(n)');

subplot(1,3,2), hold on, box on;
stem(n,yzi(:,2),'k');
set(gca,'FontSize',14,'XLim',[0,20],'YLim',[-0.5,1.01]);
xlabel('n');
ylabel('y_{zi}^{(2)}(n)');

subplot(1,3,3), hold on, box on;
stem(n,y(:,2),'k');
set(gca,'FontSize',14,'XLim',[0,20],'YLim',[-0.5,1.01]);
xlabel('n');
ylabel('y^{(2)}(n)');
