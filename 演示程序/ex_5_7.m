clear all, close all, clc;

t = [0:.1:40]';
figure, id = 1;
for omega = .5:-.25:0
    for sigma = -.06:.03:.06
        p = sigma + j*omega;
        if omega ~= 0
            p = [p;p'];
        end
        [b a] = zp2tf([],p,1);
        subplot(3,5,id);
        impulse(b,a,t);
        set(gca,'YLim',[-20,20]);
        id = id + 1;
    end
end