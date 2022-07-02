function P1 = drawRect(P,pieces)
    %load('FaceDetect.mat');
    dim = size(pieces);
    dim = dim(1);
    for n =1:dim
        h = pieces(n,1);
        w = pieces(n,2);
        height = pieces(n,3);
        width = pieces(n,4);
        for m = h : h + height -1
            P(m,w,:) =[255,0,0];
            P(m,w+width-1,:) = [255,0,0];
        end
        for m = w : w + width -1
        P(h,m,:) = [255,0,0];
        P(h + height -1,m,:) = [255,0,0];
        end
    end
    P1 = P;
    %save('FaceDetect.mat','P');
end