close all,clear all,clc;
% decode
P = decoding('jpegcodes.mat','JpegCoeff.mat');

% show vision difference
load('hall.mat');
figure;
subplot(2,1,1);
imshow(hall_gray);
title('original');
subplot(2,1,2);
imshow(P);
title('processed');

% PSNR
PSNR = myPSNR(P,hall_gray);