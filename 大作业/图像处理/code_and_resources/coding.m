function coding(CM,height,width,B,C)
load(B);
a = size(CM);
pieceNum = a(2); %ͼƬ������
% CD coding
CD = CM(1,:); %DC ϵ����������һ��ʼд����֮��Ͳ���Ļ����ˡ�����
CDH = [CD(1)*2,CD(1:pieceNum - 1)] - CD;%Ԥ�����
category = (floor(log2(abs(CDH))) +1);%categoryֵ
category(category == -Inf) = 0;
CDcode = ''; %DC����
for n = 1 : pieceNum
    L = DCTAB(category(n)+1,1);
    huffmanCode = char(DCTAB(category(n)+1,2:L+1)+'0');
    CDcode = [CDcode,huffmanCode,complement(CDH(n))];
end

% AC coding
ACcode = ''; %AC����
for m = 1:pieceNum
    Run = 0; %Runֵ
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
        Size = Size(2); %sizeֵ
        L = ACTAB(Run*10+Size,3);
        RunSizeCode = char(ACTAB(Run*10+Size,4:3+L)+'0');
        Amplitude = complement(CM(n,m)); %amplitudeֵ
        ACcode = [ACcode,RunSizeCode,Amplitude];
        Run = 0;
    end
    ACcode = [ACcode,'1010'];
end



save(C,'CDcode','ACcode','height','width');
end