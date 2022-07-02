close all,clear all,clc;
load('hall.mat');
% code
[CM,height,width] = photoProcess(hall_gray,'JpegCoeff1.mat');
coding(CM,height,width,'JpegCoeff1.mat','jpegcodes1.mat');

%decode
P = decoding('jpegcodes1.mat','JpegCoeff1.mat');

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
PSNR = myPSNR(P,hall_gray)