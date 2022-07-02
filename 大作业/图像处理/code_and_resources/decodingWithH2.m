function [P,Code] = decodingWithH2(a,B,CodeSize)
    if nargin ==0
        a = 'jpegcodes.mat';
    end
    load(a);
    load(B)
    pieceNum = height*width/64;
    CM1 = zeros(64,pieceNum);
    CDH1 = zeros(1,pieceNum);
    CD1 = zeros(1,pieceNum);
    Code = char(zeros(1,CodeSize)+'0');
    
    % DC decoding
    n=1;
    for count = 1 : pieceNum
        for k = 1: 12
            L = DCTAB(k,1);
            huffmanCode = char(DCTAB(k,2:L+1)+'0');
           if strcmp(CDcode(n:n+L-1),huffmanCode)
               n = n + L;
               errorLength = k - 1;
               if errorLength 
                   error  = CDcode(n:n + errorLength - 1);
                   CDH1(1,count) = decomplement(error);
               end
               n = n + errorLength;
               break;
           end
        end
    end
    
    CD1(1) = CDH1(1);
    for n = 2 : pieceNum
        CD1(n) = CD1(n-1) - CDH1(n);
    end
    CM1(1,:) = CD1;
    
    % AC decoding
    ACsize = size(ACcode);
    ACsize = ACsize(2); 
    n = 1;
    for count1 = 1: pieceNum
        count2 = 2;
       while 1
          if strcmp(ACcode(n:n+3),'1010')
             CM1(count2:64,count1) = zeros(64-count2+1,1);
             n = n + 4;
             break;
          end
          if n+10 <ACsize
            if strcmp(ACcode(n:n+10),'11111111001')
                CM1(count2:count2+15,count1) = zeros(16,1);
                n = n + 11;
                count2 = count2 +16;
                continue;
            end
          end
          for k = 1 : 160 
              L = ACTAB(k,3);
              RunSizeCode = char(ACTAB(k,4:3+L)+'0');
              if n+L-1<ACsize
                if(strcmp(ACcode(n:n+L-1),RunSizeCode))
                    n = n + L;
                    Alength = ACTAB(k,2);
                    Run = ACTAB(k,1);
                    Amplitude = decomplement(ACcode(n:n + Alength-1));
                    CM1(count2:count2+Run-1,count1)=zeros(Run,1);
                    count2 = count2 + Run;
                    CM1(count2,count1) = Amplitude;
                    count2 = count2 + 1;
                    n = n + Alength;
                    break;
                end 
              end
          end
       end
    end
    
    % izigzag
    CQ1 = zeros(8,8,pieceNum);
    for n = 1: pieceNum
        CQ1(:,:,n) = izigzag(CM1(:,n)); 
    end
    
    % get the imformation
    for n = 1 : CodeSize
       channel = floor((n-1)/8)+1;
       %row = floor((n - (channel-1) *64 - 1)/8)+1;
       row = 1;
       col = n - (channel-1)*8;
       bCQ = complement1(CQ1(row,col,channel));
       bCQsize = size(bCQ);
       bCQsize = bCQsize(2);
       Code(n) = bCQ(bCQsize);
    end
    
    %iquantization
    C1 = CQ1 .* QTAB;
    
    %idct
    pieces1 = zeros(8,8,pieceNum);
    for n = 1: pieceNum
        pieces1(:,:,n) = idct2(C1(:,:,n));
    end
    
    %gather
    P = zeros(height,width);
    for m = 1: height/8
        for n= 1: width/8
            P((m-1)*8+1:m*8,(n-1)*8+1:n*8) = pieces1(:,:,(m-1)*width/8+n);
        end
    end
    P = uint8(P + 128);
end



