function [B,h,w]= photoProcess(A,B)
    [height,width] = size(A); %图片的高、宽
    P = double(A) - 128;
    pieceNum = height*width/64; %要分块的数目
    pieces = zeros(8,8,pieceNum); %分块后的图片块

    % cut into pieces
    for m = 1: height/8
        for n= 1: width/8
            pieces(:,:,(m-1)*width/8+n) = P((m-1)*8+1:m*8,(n-1)*8+1:n*8);
        end
    end

    % dct
    C = zeros(8,8,pieceNum); %dct系数
    for n = 1 : pieceNum
        C(:,:,n) = dct2(pieces(:,:,n));
    end

    % quantization
    load(B); 
    CQ = round(C./QTAB); %量化后的系数矩阵

    % zigzag
    CM = zeros(64,pieceNum); %zig-zag扫描后的矩阵
    for n = 1 : pieceNum
        CM(:,n) = zigzag(CQ(:,:,n));
    end
    B= CM;
    h = height;
    w = width;
end