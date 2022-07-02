clear all, close all, clc;

txt = {'不稳定';'稳定'};
As = tf(1,[1,1,-1]);
As1 = zpk(As);
disp(['A(s)系统',txt{1+all(As1.p{:}<0)}]);
k = 2;
Fs = tf(k,1);
Hs = feedback(As,Fs);
Hs1 = zpk(Hs);
disp(['H(s)系统',txt{1+all(Hs1.p{:}<0)}]);
