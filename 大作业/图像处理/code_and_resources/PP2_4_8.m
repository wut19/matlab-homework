close all,clear all,clc;
load('hall.mat');
[CM,height,width] = photoProcess(hall_gray,'JpegCoeff.mat');
