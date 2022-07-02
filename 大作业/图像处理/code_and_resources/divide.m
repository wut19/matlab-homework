function Record = divide(P,L,piece,num,record)
    %[height,width,channel] = size(P);
    d1 = 0.5;
    d2 = 0.8;
    maxNum = 3;
    %[h,w,height,width]  = piece;
    h = piece(1);
    w = piece(2);
    height = piece(3);
    width = piece(4);
    if num==1
        height_d = floor(height/10);
        width_d = floor(width/10);
        hn = floor((height - height_d)/(height_d/2));
        wn = floor((width - width_d)/(width_d/2));
    else
        hn = 5;
        wn = 5;
        height_d = floor(height / 2)+mod(height,10)- mod(floor(height/2),10);
        width_d = floor(width /2)+mod(width,10)- mod(floor(width/2),10);
    end
    
    %cut into some pieces
    hstep = floor((height - height_d)/hn)-1;
    wstep = floor((width - width_d)/wn)-1;
    pieces = zeros((hn+1)*(wn+1),4);
    for m = 1: hn + 1
        for n = 1: wn +1
            pieces((hn+1)*(m-1)+n,:) = [h+(m-1)*hstep,w+(n-1)*wstep,height_d,width_d];
        end
    end
            
%     pieces(1,1:4) = [h,w,height_d*2,width_d*2];
%     pieces(2,1:4) = [h,w+width_d,height_d*2,width_d*2];
%     pieces(3,1:4) = [h,w+width_d*2,height_d*2,width-width_d*2];
%     pieces(4,1:4) = [h+height_d,w,height_d*2,width_d*2];
%     pieces(5,1:4) = [h+height_d,w+width_d,height_d*2,width_d*2];
%     pieces(6,1:4) = [h+height_d,w+width_d*2,height_d*2,width-width_d*2];
%     pieces(7,1:4) = [h+2*height_d,w,height-height_d*2,width_d*2];
%     pieces(8,1:4) = [h+2*height_d,w+width_d,height-height_d*2,width_d*2];
%     pieces(9,1:4) = [h+2*height_d,w+2*width_d,height-height_d*2,width-width_d*2];
    
    % detect
    for n = 1:(hn+1)*(wn+1)
       P1 = P(pieces(n,1):pieces(n,1)+pieces(n,3)-1,pieces(n,2):pieces(n,2)+pieces(n,4)-1,:);
       d = detect(P1,L);
       if d <d1
           %drawRect(L,pieces(n,:));
           dim = size(record);
           dim = dim(1);
           if(dim == 1&&~any(record)) 
               record = [pieces(n,:),d];
           else
               record(dim+1,:) = [pieces(n,:),d];
           end
       elseif d<d2 && num<maxNum
           record = divide(P,L,pieces(n,:),n+1,record);
       end
    end
    Record = record;
end