close all,clear all,clc;
% information
a = char(zeros(1,30*168)+'0');
b= char(ones(1,30*168)+'0');
Bcode = [a,b,a,b]; % 信息

% hide information
load('hall.mat');
P = SIH(hall_gray,Bcode); %隐藏信息的图片
imshow(P);

% direct get the information(without code and decode)
code1 = iSIH(P,120*168);

% code
[CM,height,width] = photoProcess(P,'JpegCoeff.mat');
coding(CM,height,width,'JpegCoeff.mat','jpegcodes3.mat');

%decode
P1 = decoding('jpegcodes3.mat','JpegCoeff.mat');

% get the information
code2 = iSIH(P1,120*168);

e1 = code1 - Bcode
e2 = code2 - Bcode