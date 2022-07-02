figure;
subplot(2,2,1); plot(omg, unwrap(angle(H1)));
subplot(2,2,2); plot(omg, unwrap(angle(H2)));
subplot(2,2,3); plot(t, real(x), 'k--', t, real(y1), 'k-');
subplot(2,2,4); plot(t, real(x), 'k--', t, real(y2), 'k-');
