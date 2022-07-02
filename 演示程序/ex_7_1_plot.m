figure, box on, hold on;
stem(n,x,'k:');
stem(n,y,'k-');
set(gca,'FontSize',16);
xlabel('Samples');
legend('x(n)','y(n)');