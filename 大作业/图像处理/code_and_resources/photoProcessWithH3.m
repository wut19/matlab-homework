function [B,h,w] = photoProcessWithH3(A,B,Code)
    [height,width] = size(A);
    P = double(A) - 128;
    pieceNum = height*width/64;
    pieces = zeros(8,8,pieceNum);

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

    % zigzag
    CM = zeros(64,pieceNum);
    for n = 1 : pieceNum
        CM(:,n) = zigzag(CQ(:,:,n));
    end
    
    % hide information
    for n = 1 : pieceNum
        for m = 64 :-1: 1
            if CM(m,n) ~= 0 
                if m <64
                    CM(m+1,n) = Code(n);
                end
                if m ==64
                    CM(64,n) = Code(n);
                end
                break;
            end
             if m == 1
                 CM(1,n) = Code(n);
             end
        end
    end
    
    B= CM;
    h = height;
    w = width;
end