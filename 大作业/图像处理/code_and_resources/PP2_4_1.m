close all,clear all,clc;
load('hall.mat');
piece1 = double(hall_gray(65:72,81:88));%截取一部分图片
piece2 = piece1 -128; %减去128
C = dct2(piece1);
C(1) = C(1) -128*8; %变换域处理
piece3 = idct2(C);
error = piece3-piece2 %比较