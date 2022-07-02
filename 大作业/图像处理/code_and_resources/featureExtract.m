function Feature = featureExtract(P,L)
       [height,width,~] = size(P);
       P = double(P);
       Feature = zeros(1,2^(3*L));
       for k = 1 : height
           for s = 1 : width
               c = floor([P(k,s,1),P(k,s,2),P(k,s,3)]/(2^(8-L)));
               cn = c(3)*2^(2*L)+c(2)*2^L+c(1);
               Feature(cn+1) = Feature(cn+1) + 1;
           end
       end
       
       %normalization
       Feature = Feature / sum(Feature);
end