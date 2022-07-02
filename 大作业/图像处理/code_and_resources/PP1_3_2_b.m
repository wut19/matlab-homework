clear all,close all,clc;
load('hall.mat');
image(hall_color);
imwrite(hall_color,'E:\personal\matlabСѧ��\����ҵ\ͼ����\code_and_resources\outputs\1_3_2_b\original.tif');
[height,width,channel] = size(hall_color);
squaresize = gcd(height,width);  %�����Լ������ʾ���ӵĿ��
square_h = height/squaresize; %�߶ȷ����ϵĸ�����
square_w = width/squaresize; %��ȷ����ϵĸ�����
% ������ӿ�ȴ�С��1����͸�������С��0��1����Ϊ����kronecker��������׼��
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
c = kron(b,a); %����������
for n = 1 : 3
    hall_color(:,:,n) = double(hall_color(:,:,n)) .* c;
end
figure;
image(hall_color);
imwrite(hall_color,'E:\personal\matlabСѧ��\����ҵ\ͼ����\code_and_resources\outputs\1_3_2_b\processed.tif');