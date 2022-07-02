close all,clear all,clc;
load('hall.mat');
% information
a1 = char(zeros(1,30*168)+'0');
b1= char(ones(1,30*168)+'0');
Bcode1 = [a1,b1,a1,b1]; %信息
codesize1 = size(Bcode1);
codesize1 = codesize1(2);

a2 = char(zeros(1,30*21)+'0');
b2 = char(ones(1,30*21)+'0');
Bcode2 = [a2,b2,a2,b2]; %信息
codesize2 = size(Bcode2);
codesize2 = codesize2(2);

a3 = ones(1,105);
Bcode3 = [a3,-a3,a3]; %信息
codesize3 = size(Bcode3);
codesize3 = codesize3(2);

% no information to hide
% code
[CM,height,width] = photoProcess(hall_gray,'JpegCoeff.mat');
coding(CM,height,width,'JpegCoeff.mat','jpegcodes.mat');

%decode
P = decoding('jpegcodes.mat','JpegCoeff.mat');


% method 1
% code
[CM,height,width] = photoProcessWithH1(hall_gray,'JpegCoeff.mat',Bcode1);
coding(CM,height,width,'JpegCoeff.mat','jpegcodes4.mat');

%decode
[P1,code1] = decodingWithH1('jpegcodes4.mat','JpegCoeff.mat',codesize1);


% method 2
%code
[CM,height,width] = photoProcessWithH2(hall_gray,'JpegCoeff.mat',Bcode2);
coding(CM,height,width,'JpegCoeff.mat','jpegcodes5.mat');

%decode
[P2,code2] = decodingWithH2('jpegcodes5.mat','JpegCoeff.mat',codesize2);


% method3
%code
[CM,height,width] = photoProcessWithH3(hall_gray,'JpegCoeff.mat',Bcode3);
coding(CM,height,width,'JpegCoeff.mat','jpegcodes6.mat');

%decode
[P3,code3] = decodingWithH3('jpegcodes6.mat','JpegCoeff.mat',codesize3);

%PSNR
PSNR = myPSNR(P,hall_gray);
PSNR_1 = myPSNR(P1,hall_gray);
PSNR_2 = myPSNR(P2,hall_gray);
PSNR_3 = myPSNR(P3,hall_gray);

% show image
figure;
subplot(2,2,1);
imshow(P);
title('original');
subplot(2,2,2);
imshow(P1);
title('Method 1');
subplot(2,2,3);
imshow(P2);
title('Method 2');
subplot(2,2,4);
imshow(P3);
title('Method 3');

