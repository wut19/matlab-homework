close all,clear all,clc;
load('hall.mat');
piece1 = double(hall_gray(65:72,81:88));%��ȡһ����ͼƬ
piece2 = piece1 -128; %��ȥ128
C = dct2(piece1);
C(1) = C(1) -128*8; %�任����
piece3 = idct2(C);
error = piece3-piece2 %�Ƚ�