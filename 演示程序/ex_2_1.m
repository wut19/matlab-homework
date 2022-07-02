% pls run ex_1_1.m first

figure;
hold on;
plot(t,x);
plot(t,z1,'r');
plot(t2,z2,'k-o');
plot(t3,z3,'g--');
xlabel('t(seconds)');
ylabel('signals');
legend('x','z_1','z_2','z_3');
figure;
subplot(1,2,1);
plot(t,z4,'k',t,x,'b:',t,y,'r:');
title('z_4(t)');
subplot(1,2,2);
plot(t,z5,'k',t,x,'b:',t,y,'r:');
title('z_5(t)');