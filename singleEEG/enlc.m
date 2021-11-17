function [ Sgup,Sgd ] = enlc( data )
% 提取上下包络
% 输入:
% data:脑电数据
% 输出:
% Sgup:上包络
% Sgd:下包络

[Sgup,Sgd]=envelope(data,500,'peak');

end

