close all,clear all,clc;
load('hall.mat');
P = double(hall_gray(65:72,81:88));
C = dct2(P);
C1 = C.'; %系数矩阵转置
C2 = rot90(C); %系数矩阵旋转90度
C3 = rot90(C,2); %系数矩阵旋转180°

P1 = idct2(C1);
P2 = idct2(C2);
P3 = idct2(C3);

figure;
subplot(2,2,1);
imshow(uint8(P));
title('original');
subplot(2,2,2);
imshow(uint8(P1));
title('transverse');
subplot(2,2,3);
imshow(uint8(P2));
title('rot 90');
subplot(2,2,4);
imshow(uint8(P3));
title('rot 180');