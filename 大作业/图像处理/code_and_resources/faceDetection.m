%��ͼƬ���в�ͬ�׶εĻ��֡�ʶ��С����ֱֵ�ӽ����ͼ����
%δ�ﵽ��ֵ��ѡ�����С��һ���ֽ�����һ�׶εĻ���ʶ��
%��ͼ���ڿ��Ե��ڿ�ͼ��Χ
function  faceDetection(P,L)
    [height,width,~ ] = size(P);
    %save('FaceDetect.mat','P');
    record = zeros(1,5);
    d = detect(P,L)
    if d >0.4 
        record = divide(P,L,[1,1,height,width],1,record);
    else
        record = [1,1,height,width,d];
        %drawRect(L,[1,1,height,width]);
    end
    for n =1:3
        record = recordChoose(record); 
        
    end
    record = adjust(P,record,L);
    P = drawRect(P,record(:,1:4));
    %load('FaceDetect.mat');
    figure;
    image(P);
end