close all,clear all,clc;
load('snow.mat');
% code
[CM,height,width] = photoProcess(snow,'JpegCoeff.mat');
coding(CM,height,width,'JpegCoeff.mat','jpegcodes2.mat');

%decode
P = decoding('jpegcodes2.mat','JpegCoeff.mat');

% show vision difference
figure;
subplot(2,1,1);
imshow(snow);
title('original');
subplot(2,1,2);
imshow(P);
title('processed');

% PSNR
PSNR = myPSNR(P,snow)