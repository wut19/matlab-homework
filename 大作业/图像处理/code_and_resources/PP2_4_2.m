close all ,clear all,clc;
load('hall.mat');
P = double(hall_gray(65:72,81:88)); %测试部分
N = 8;
n = [1:2:2*N - 1].'; 
i = [0:N - 1].';
D = cos(pi/2/N*kron(i,n.')); 
D(1,:) = D(1,:)*sqrt(1/2);
D = D * sqrt(2/N); %变换矩阵
C1 = dct2(P); %调库变换结果
C2 = D * P * D.'; %手写变换结果

error = C1 -C2 % 误差