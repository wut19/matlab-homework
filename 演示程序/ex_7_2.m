clear all, close all, clc;

a = [1, -0.9, 0.3];
b = 0.05;
n = [0:20]';
u = (n>=0);
uz = zeros(size(u));
wi1 = [-a(3); 0];
wi2 = [-a(2); -a(3)];
[yzs wf] = filter(b, a, [u,u]);
[yzi wf] = filter(b, a, [uz,uz], [wi1,wi2]);
[y wf] = filter(b, a, [u,u],[wi1,wi2]);

ex_7_2_plot();
