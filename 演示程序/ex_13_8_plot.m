
figure;
dat = [g,g1,g2];
ylim = [0,0.08;-0.8,2.5;0,0.08];
ylab = ['g(t)  ';'g_1(t)';'g_2(t)'];
for n = 1:3
    subplot(3,2,2*n-1), hold on, box on;
    plot(t,real(dat(:,n)),'k');
    set(gca,'FontSize',16,'XLim',[-30 30],'YLim',ylim(n,:));
    xlabel('t');
    ylabel(ylab(n,:));
end

dat = [G,G1,G2];
ylim = [0,1;0,1;-1e-3,20e-3];
ylab = ['G(\omega)  ';'G_1(\omega)';'G_2(\omega)'];
for n = 1:3
    subplot(3,2,2*n), hold on, box on;
    plot(omg,real(dat(:,n)),'k');
    set(gca,'FontSize',16,'XLim',[-15 15],'YLim',ylim(n,:));
    xlabel('\omega');
    ylabel(ylab(n,:));
end
