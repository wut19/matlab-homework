clear all, close all, clc;

data = struct('title',{'(a)','(b)','(c)','(d)',...
    '(e)','(f)','(g)','(h)'},'zeros',{[],[0],[0;0],...
    [-0.5],[0],[1.2j;-1.2j],[0;0],[1.2j;-1.2j]},...
    'poles',{[-2;-1],[-2;-1],[-2;-1],[-2;-1],...
    [-1+j;-1-j],[-1+j;-1-j],[-1+j;-1-j],[j;-j]});
omega = [0.01:0.01:6]';
figure;
for id = 1:8
    [b,a] = zp2tf(data(id).zeros,data(id).poles,1);
    H = freqs(b,a,omega);
    subplot(4,2,id);
    plot(omega,abs(H));
    set(gca,'YScale','log','FontSize',16);
    title(data(id).title);
    xlabel('\omega');
    ylabel('H(\omega');
end
