function [ band_S ] = exband( data,band_Y )
% С������ȡƵ���ź�
% ����:
% data:����
% band_Y:Ƶ������,����[x1,x2]
% ���:
% band_S:Ƶ���ź�
band_S=Extract_band(data,band_Y(1),band_Y(2));


end

