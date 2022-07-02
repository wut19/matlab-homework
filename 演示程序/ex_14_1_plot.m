
figure;

dat = [f1,f2,x,y,x1,y1];
lab = ['f_1(t)';'f_2(t)';'x(t)  ';'y(t)  ';'x_1(t)';'y_1(t)'];
for n = 1:6
    subplot(3,2,n), hold on, box on;
    plot(t,real(dat(:,n)),'k-');
    set(gca,'FontSize',14,'XLim',[-2 2]);
    if n>=3
        set(gca,'YLim',[0 0.5]);
    end
    xlabel('t');
    ylabel(lab(n,:));
end


