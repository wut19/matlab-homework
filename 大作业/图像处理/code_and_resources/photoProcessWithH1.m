function [B,h,w] = photoProcessWithH1(A,B,Code)
    [height,width] = size(A);
    P = double(A) - 128;
    pieceNum = height*width/64;
    pieces = zeros(8,8,pieceNum);
    CodeSize = size(Code);
    CodeSize = CodeSize(2);
    if CodeSize > height*width
        error('the picture is too small or the information os too big!');
    end
    
    % cut into pieces
    for m = 1: height/8
        for n= 1: width/8
            pieces(:,:,(m-1)*width/8+n) = P((m-1)*8+1:m*8,(n-1)*8+1:n*8);
        end
    end

    % dct
    C = zeros(8,8,pieceNum);
    for n = 1 : pieceNum
        C(:,:,n) = dct2(pieces(:,:,n));
    end

    % quantization
    load(B); 
    CQ = round(C./QTAB);
    
    % hide the information
    for n = 1 : CodeSize
       channel = floor((n-1)/64)+1;
       row = floor((n - (channel-1) *64 - 1)/8)+1;
       col = n - (channel-1)*64 - (row-1)*8;
       bCQ = complement1(CQ(row,col,channel));
       bCQsize = size(bCQ);
       bCQsize = bCQsize(2);
       bCQ(bCQsize) = Code(n);
       CQ(row,col,channel) = decomplement(bCQ);
    end
            
    
    % zigzag
    CM = zeros(64,pieceNum);
    for n = 1 : pieceNum
        CM(:,n) = zigzag(CQ(:,:,n));
    end
    B= CM;
    h = height;
    w = width;
end