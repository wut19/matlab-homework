function result=wxh(M,N,simu)
result=zeros(simu,1);
for count=1:simu
tic
%count
A = zeros(M,N);
A = sqrt(1/M)*randn(M,N);
P=eye(N)-A'*inv(A*A')*A;
t=inf;
for i=0:2^(N-1)-1
    b=dec2bin(i);
    lb=length(b);
    s=-ones(N,1);
    for j=N-lb+1:N
        if b(j-N+lb)=='1'
            s(j)=1;
        end
    end
    Ps=norm(P*s);
    if Ps<t
        t=Ps;
    end
end
result(count)=t;
save result.mat count result
toc
end
end