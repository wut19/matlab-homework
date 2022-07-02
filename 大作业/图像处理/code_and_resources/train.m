function feature = train( L,file )
    
    if L>8 
        error('L is too large!');
    end
    
    Feature = zeros(1,2^(3*L));
    AvFeature = zeros(1,2^(3*L));
    
    for n = 1: 33
        % read the training pictures 
       if n < 10
           num = char(n+'0');
       else
           num = [char(floor(n/10)+'0'),char(mod(n,10)+'0')];
       end
       P = imread(['Faces/',num,'.bmp']);
       P = double(P);
       [height,width,~] = size(P);
       
       % get the feature
       for k = 1 : height
           for s = 1 : width
               c = floor([P(k,s,1),P(k,s,2),P(k,s,3)]/(2^(8-L)));
               cn = c(3)*2^(2*L)+c(2)*2^L+c(1);
               Feature(cn+1) = Feature(cn+1) + 1;
           end
       end
       
       %normalization
       Feature = Feature / sum(Feature);
       
       %Average
       AvFeature = AvFeature + 1/n *(Feature - AvFeature);
    end
    feature = AvFeature;
    save(file,'AvFeature');
end