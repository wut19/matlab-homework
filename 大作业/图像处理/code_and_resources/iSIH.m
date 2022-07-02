function Bcode = iSIH(P1,codeSize)
    code = char(zeros(1,codeSize)+'0');
    [height,width] = size(P1);
    A = reshape(P1.',1,height*width);
    for n = 1:codeSize
        Acode = dec2bin(A(n));
        Asize = size(Acode);
        Asize = Asize(2);
        code(n) = Acode(Asize);
    end
    Bcode = code;
end
