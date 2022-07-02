function [w,tw] = conv1(u,tu,v,tv)
% 输入参数
% u和v表示两个序列，tu和tv分别表示它们的抽样时间
% 返回值
% w和tw分别表示卷积结果及其抽样时间

T = tu(2)-tu(1);
w = T*conv(double(u),double(v));
tw = tu(1)+tv(1)+T*[0:length(u)+length(v)-2]';
