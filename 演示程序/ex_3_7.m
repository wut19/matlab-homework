clear all, close all, clc;

a = [1, 7, 10];
b = [1, 6, 4];
sys = tf(b,a);
t = [0:0.01:3]';
figure;
subplot(2,2,1);
step(sys);

subplot(2,2,2);
x_step = zeros(size(t));
x_step(t>0) = 1;
x_step(t==0) = 1/2;
lsim(sys,x_step,t);

subplot(2,2,3);
[h1,t1] = impulse(sys,t);
plot(t1,h1,'k');
title('Impulse Response');
xlabel('Time(sec)');
ylabel('Amplitude');

subplot(2,2,4);
x_delta = zeros(size(t));
x_delta(t==0) = 100;
[y1,t] = lsim(sys,x_delta,t);
y2 = y1 - x_delta;
plot(t,y2,'k');
title('Impulse Response');
xlabel('Time(sec)');
ylabel('Amplitude');
