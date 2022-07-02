ftsz = 12;
figure;
data = [h,x,yc(1:21),yf1,yf2,yf3];
labels = {'h(n)';'x(n)';'y_c(n)';'y_{f1}(n)';'y_{f2}(n)'};
for k = 1:5
    subplot(5,1,k), hold on, box on;
    stem(n,data(:,k),'k-'); 
    set(gca,'FontSize',12);
    ylabel(labels{k});
end
xlabel('n');