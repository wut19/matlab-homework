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
sound(x);
