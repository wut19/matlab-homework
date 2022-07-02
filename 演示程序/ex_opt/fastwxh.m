function result=fastwxh(M,N,T,simu)
fastresult=zeros(simu,1);

Tnum = 2^T;
st = -ones(T,1);
starray = zeros(T, Tnum);
for i = 1:Tnum
    starray(:,i) = st;
    for n = T:-1:1
        st(n) = st(n) + 1;
        if st(n) == 2
            st(n) = -1;
        else
            st(n) = 1;   
            break;
        end
    end
end

for fastcount=1:simu
tic
%fastcount
A = zeros(M,N);
A = sqrt(1/M)*randn(M,N);
P = eye(N)-A'*inv(A*A')*A;

PH = P(:,1:N-T);
PT = P(:,end+1-T:end);
PTsarray = PT*starray;

t=inf;
s = -ones(N-T,1);
for i=0:2^(N-T-1)-1
    PHs = PH*s;
    Psarray = PHs*ones(1,Tnum) + PTsarray;
    Ps = min(sqrt(sum(Psarray.*Psarray,1)));
    if Ps<t
        t=Ps;
    end
    for n = N-T:-1:1
        s(n) = s(n) + 1;
        if s(n) == 2
            s(n) = -1;
        else
            s(n) = 1;   
            break;
        end
    end
end
fastresult(fastcount)=t;
save fastresult.mat fastcount fastresult
toc
end
end