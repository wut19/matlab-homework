function Record = adjust(P,record,L)
    tryTime = 30;
    dim = size(record);
    dim = dim(1);
    for n= 1 :dim
        h = record(n,1);
        w = record(n,2);
        height = record(n,3);
        width = record(n,4);
        dmin = record(n,5);
        mu = [0,0,0,0];
        sigma = [height/3,width/3,height/6,width/6];
        gm = gmdistribution(mu,sigma);
        for m =1:tryTime
            randnum = random(gm);
            dh = randnum(1);
            dw = randnum(2);
            dheight = randnum(3);
            dwidth = randnum(4);
            h1 = floor(h+dh);
            w1 = floor(w+dw);
            height1 = floor(height+dheight);
            width1 = floor(width+dwidth);
            if(h1>0&&w1>0&&height1>0&&width1>0)
                d1 = detect(P(h1:h1+height1-1,w1:w1+width1-1,:),L);
                if(d1<dmin)
                   h = h1;
                   w = w1;
                   height = height1;
                   width = width1;
                   dmin = d1;
                end
            end
        end
        record(n,:) = [h,w,height,width,dmin];    
    end
    Record = record;
end