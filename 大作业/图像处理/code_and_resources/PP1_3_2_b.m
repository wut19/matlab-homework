clear all,close all,clc;
load('hall.mat');
image(hall_color);
imwrite(hall_color,'E:\personal\matlab小学期\大作业\图像处理\code_and_resources\outputs\1_3_2_b\original.tif');
[height,width,channel] = size(hall_color);
squaresize = gcd(height,width);  %用最大公约数来表示格子的宽度
square_h = height/squaresize; %高度方向上的格子数
square_w = width/squaresize; %宽度方向上的格子数
% 构造格子宽度大小的1矩阵和格子数大小的0，1矩阵，为后面kronecker张量积作准备
a = ones(squaresize); 
%size(a)
b = zeros(square_h,square_w);
%size(b)
for m = 1 : square_h
    for n = 1 : square_w
        if (mod(m,2)==1&&mod(n,2)==1)||(mod(m,2)==0&&mod(n,2)==0)
            b(m,n) = 1;
        end
    end
end
c = kron(b,a); %构造张量积
for n = 1 : 3
    hall_color(:,:,n) = double(hall_color(:,:,n)) .* c;
end
figure;
image(hall_color);
imwrite(hall_color,'E:\personal\matlab小学期\大作业\图像处理\code_and_resources\outputs\1_3_2_b\processed.tif');