function Record = recordChoose(record)
    Record = record(1,:);
    dim = size(record);
    dim = dim(1);
    num = 1;
    if dim>1
        for n = 2 : dim
      	center1 = [record(n,1)+record(n,3)/2,record(n,2)+record(n,4)/2];
        count = 0; 
        for m = 1 :num
                center2 = [Record(m,1)+Record(m,3)/2,Record(m,2)+Record(m,4)/2];
                if norm(center1-center2)<max(record(n,3)/2+Record(m,3)/2,record(n,4)/2+Record(m,4)/2)
                    if record(n,5)<Record(m,5)
                        Record(m,:) = record(n,:);
                    end            
                else 
                    count = count+1;
                end
        end
            if(count == num)
            num = num+1;
            Record(num,:) = record(n,:);
            end
        end
    end
           
end