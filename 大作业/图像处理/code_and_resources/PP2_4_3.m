close all,clear all,clc
load('hall.mat');
P = double(hall_gray(65:72,81:88));
C = dct2(P);
C1 = C;
C2 = C;
C1(:,5:8) = C1(:,5:8)*0;%后四列置零
C2(:,1:4) = C2(:,1:4)*0;%前四列置零
P1 = idct2(C1);
P2 = idct(C2);
figure,subplot(3,1,1);
imshow(uint8(P));
title('original');
subplot(3,1,2);
imshow(uint8(P1));
title('5-8 column set to 0');
subplot(3,1,3);
imshow(uint8(P2));
title('1-4 column set to 0');
PP1 = P - P1
PP2 = P - P2 
