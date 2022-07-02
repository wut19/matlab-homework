% run ex_8_7.m first

n = [0:8000]';
x = 0.5*(mod(n,10)<5);
y = filter(b,a,x);

sound([x;y]);
wavwrite(x,'input');
wavwrite(y,'output');