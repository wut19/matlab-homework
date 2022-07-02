close all,clear all,clc;
t = [0:0.0001:1].'; %抽样频率为10k
n = [0:length(t)].';
PT = 0; %基音周期
PNum = 100;  %片段数
FPP = 0.01/0.0001;
x = zeros(length(t),1); %语音信号
r = 0;
for n = 0: PNum - 1
    PT = 80 + 5*mod(n,50); %得到该片段的PT
    x(n*FPP+1:(n+1)*FPP) = (mod(r + [1:FPP],PT)==0);
    r = mod(r + FPP,PT);
end

e = x;

a = [1,-1.3789,0.9506];
b = [1];

s = filter(b,a,e);

figure;
subplot(2,1,1);
plot(e);
title('e');
subplot(2,1,2);
plot(s);
title('s');

sound(e);
pause(2);
sound(s);
