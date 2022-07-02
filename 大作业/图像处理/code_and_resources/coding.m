function coding(CM,height,width,B,C)
load(B);
a = size(CM);
pieceNum = a(2); %图片块数量
% CD coding
CD = CM(1,:); %DC 系数（这里我一开始写反了之后就不想改回来了。。）
CDH = [CD(1)*2,CD(1:pieceNum - 1)] - CD;%预测误差
category = (floor(log2(abs(CDH))) +1);%category值
category(category == -Inf) = 0;
CDcode = ''; %DC编码
for n = 1 : pieceNum
    L = DCTAB(category(n)+1,1);
    huffmanCode = char(DCTAB(category(n)+1,2:L+1)+'0');
    CDcode = [CDcode,huffmanCode,complement(CDH(n))];
end

% AC coding
ACcode = ''; %AC编码
for m = 1:pieceNum
    Run = 0; %Run值
    for n = 2:64
        if CM(n,m)==0
            Run = Run+1;
            continue;
        end
        if Run >15
            Run1 = mod(Run,16);
            sixteenZeroNum = (Run -Run1)/16; 
            Run = Run1;
            for k = 1: sixteenZeroNum
                ACcode = [ACcode,'11111111001'];
            end
        end
        Size = size(complement(CM(n,m)));
        Size = Size(2); %size值
        L = ACTAB(Run*10+Size,3);
        RunSizeCode = char(ACTAB(Run*10+Size,4:3+L)+'0');
        Amplitude = complement(CM(n,m)); %amplitude值
        ACcode = [ACcode,RunSizeCode,Amplitude];
        Run = 0;
    end
    ACcode = [ACcode,'1010'];
end



save(C,'CDcode','ACcode','height','width');
end