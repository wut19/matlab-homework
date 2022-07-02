clear all, close all, clc;
pos = [26, 19, 18, 17, 24, 27, 13, 11, 9, 23, 28, 7, 4, 1, 22];
figure;
id = 1;
for r = 0.8:0.2:1.2
    for theta = 0:pi/4:pi
        p = r*exp(j*theta);
        if theta ~= 0 & theta ~= pi
            p = [p;p'];
        end
        [b a] = zp2tf([],p,1);
        subplot(4,7,pos(id));
        [h,t] = impz(b,a,20);
        stem(t,h,'k-','MarkerSize',5);
        id = id + 1;
    end
end