figure;
dat = [g,f,g0,g1];
txt = ['g(t)  ';'f(t)  ';'g_0(t)';'g_1(t)'];
for n = 1:4
    subplot(4,1,n), hold on, box on;
    plot(t,real(dat(:,n)),'k-');
    set(gca,'FontSize',16);
    xlabel('t'); ylabel(txt(n,:));
end

figure;
dat = [G,F,G0,H,G1];
rng = [-2,8;-1,4;-1,4;-0.5,1.5;-1,4];
txt = ['G(\omega)  ';'F(\omega)  ';'G_0(\omega)';'H(\omega)  ';'G_1(\omega)'];
for n = 1:5
    subplot(5,1,n), hold on, box on;
    plot(omg,real(dat(:,n)),'k-');
    set(gca,'FontSize',14,'XLim',[-250,250],'YLim',rng(n,:));
    xlabel('\omega');ylabel(txt(n,:));
end
