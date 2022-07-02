clear all, close all, clc;

t = [0:0.1:2*pi]';
fh = {@sin, @cos};
fh{3} = str2func('exp');
fh{4} = @(t)t.^2-4*t+1;
figure;
for n = 1:4
    subplot(2,2,n);
    plot(t,fh{n}(t));
    xlabel('t');
    title([func2str(fh{n}),'(t)']);
    set(gca,'XLim',[0,2*pi]);
end