function b = complement(a)
    if a>0 
       b = dec2bin(a);
       return ;
    end
    if a == 0 
        b = '';
        return
    end
    a = abs(a);
    a = dec2bin(a);
    b(a == '1') = '0';
    b(a == '0') = '1';
    return ;
end