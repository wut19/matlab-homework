figure; hold on, box on, grid on;
stem(n,x,'k--');
stem(n,y,'k-');
set(gca,'FontSize',16,'XLim',[0 30],'YLim',[-1.1 1.1]);
xlabel('n');
legend('x(n)','y(n)');
