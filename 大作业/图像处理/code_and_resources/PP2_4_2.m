close all ,clear all,clc;
load('hall.mat');
P = double(hall_gray(65:72,81:88)); %���Բ���
N = 8;
n = [1:2:2*N - 1].'; 
i = [0:N - 1].';
D = cos(pi/2/N*kron(i,n.')); 
D(1,:) = D(1,:)*sqrt(1/2);
D = D * sqrt(2/N); %�任����
C1 = dct2(P); %����任���
C2 = D * P * D.'; %��д�任���

error = C1 -C2 % ���