function [B,h,w]= photoProcess(A,B)
    [height,width] = size(A); %ͼƬ�ĸߡ���
    P = double(A) - 128;
    pieceNum = height*width/64; %Ҫ�ֿ����Ŀ
    pieces = zeros(8,8,pieceNum); %�ֿ���ͼƬ��

    % cut into pieces
    for m = 1: height/8
        for n= 1: width/8
            pieces(:,:,(m-1)*width/8+n) = P((m-1)*8+1:m*8,(n-1)*8+1:n*8);
        end
    end

    % dct
    C = zeros(8,8,pieceNum); %dctϵ��
    for n = 1 : pieceNum
        C(:,:,n) = dct2(pieces(:,:,n));
    end

    % quantization
    load(B); 
    CQ = round(C./QTAB); %�������ϵ������

    % zigzag
    CM = zeros(64,pieceNum); %zig-zagɨ���ľ���
    for n = 1 : pieceNum
        CM(:,n) = zigzag(CQ(:,:,n));
    end
    B= CM;
    h = height;
    w = width;
end