function [ band_S ] = exband( data,band_Y )
% 小波包提取频段信号
% 输入:
% data:数据
% band_Y:频段区间,例如[x1,x2]
% 输出:
% band_S:频段信号
band_S=Extract_band(data,band_Y(1),band_Y(2));


end

