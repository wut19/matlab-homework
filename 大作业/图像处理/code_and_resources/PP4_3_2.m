close all,clear all,clc;
P = imread('Faces\test13.jfif');
imshow(P);
faceDetection(P,3);
faceDetection(P,4);
faceDetection(P,5);