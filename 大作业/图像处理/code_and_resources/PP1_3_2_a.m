% ��һ�µ�������ϰ��2��a��
clear all,close all,clc;
load('hall.mat');
image(hall_color);
title("original");
axis equal;
imwrite(hall_color,'E:\personal\matlabСѧ��\����ҵ\ͼ����\code_and_resources\outputs\1_3_2_a\original.tif');
[height,width,channel] = size(hall_color);
r = min(height/2,width/2);  %�뾶
center = [height/2,width/2];    %Բ��
for m = 1:height
    for n = 1:width
        if abs(norm([m,n] - center) - r) < 1
           hall_color(m,n,1) = 255;
           hall_color(m,n,2) = 0;
           hall_color(m,n,3) = 0;
        end
    end
end
figure;
image(hall_color);
axis equal;
title('processed');
imwrite(hall_color,'E:\personal\matlabСѧ��\����ҵ\ͼ����\code_and_resources\outputs\1_3_2_a\processed.tif');