function P1 = SIH(P,Bcode)
    codeSize = size(Bcode);
    codeSize = codeSize(2);
    [height,width] = size(P);
    if codeSize > height*width
        error('the picture is too small or the information os too big!');
    end
    A = reshape(P.',1,height*width);
    for n = 1: codeSize
        PixelAm = dec2bin(A(n));
        Psize = size(PixelAm);
        Psize = Psize(2);
        PixelAm(Psize) = Bcode(n);
        A(n) = bin2dec(PixelAm);
    end
    P2 = reshape(A,width,height);
    P1 = P2.';
end