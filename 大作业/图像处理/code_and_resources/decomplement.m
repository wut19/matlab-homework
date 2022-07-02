function b = decomplement(a)
    if a(1) == '1'
        b = bin2dec(a);
        return;
    end
    c(a == '1') = '0';
    c(a == '0') = '1';
    b = - bin2dec(c);
    return;
end