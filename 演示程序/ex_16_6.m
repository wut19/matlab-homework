clear all, close all, clc;

AF = zpk([],[0,-2,-4],1);
rlocus(AF);
[r,k] = rlocus(AF);
dk = 1;
while dk > 0.001
    maxrealr = max(real(r),[],1);
    idx = sum(maxrealr<=0);
    dk = [k(idx+1)-k(idx)]/16;
    [r,k] = rlocus(AF,[k(idx):dk:k(idx+1)]);
end
maxrealr = max(real(r),[],1);
idx = sum(maxrealr<=0);
disp(['K<',num2str(k(idx)),'时系统稳定']);