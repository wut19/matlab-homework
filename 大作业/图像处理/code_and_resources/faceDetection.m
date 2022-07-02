%对图片进行不同阶段的划分、识别，小于阈值直接进入框图环节
%未达到阈值的选择距离小的一部分进行下一阶段的划分识别。
%框图环节可以调节框图范围
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