figure;
subplot(3,2,1); plot(t, real(x1), 'k--', t, real(y11), 'k-');
subplot(3,2,2); plot(t, real(x1), 'k--', t, real(y12), 'k-');
subplot(3,2,3); plot(t, real(x2), 'k--', t, real(y21), 'k-');
subplot(3,2,4); plot(t, real(x2), 'k--', t, real(y22), 'k-');
subplot(3,2,5); plot(t, real(x1+x2), 'k--', t, real(y11+y21), 'k-');
subplot(3,2,6); plot(t, real(x1+x2), 'k--', t, real(y12+y22), 'k-');


