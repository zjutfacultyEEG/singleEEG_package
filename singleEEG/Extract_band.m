function [output_X]=Extract_band(input_X,min_Z,max_Z)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[m,~]=size(input_X);
dp=500;
dp1=dp/2;                                                          %�ο�˹�ز���Ƶ��
resolution=0.1;
Decomposition_layers=ceil(log(dp1/resolution)/log(2));
Actual_resolution=dp1/power(2,Decomposition_layers);
Alphe_wave_band=[min_Z,max_Z];                                          %Alphe���ι��ʱ�׼
Alphe_wave_class=zeros(1,2);
Alphe_wave_class(1)=round(Alphe_wave_band(1)/Actual_resolution);
Alphe_wave_class(2)=ceil(Alphe_wave_band(2)/Actual_resolution);
% Actual_Alphe_wave_band=Actual_resolution*Alphe_wave_class;         %ʵ����ȡ����
% L_class=Alphe_wave_class(2)-Alphe_wave_class(1)+1;
% Al_result_set=cell(L_W,1);
output_X=zeros(m,1);
Dec_res=wpdec(input_X',Decomposition_layers,'db4');
for k=Alphe_wave_class(1)+1:Alphe_wave_class(2)
    c_temp=wprcoef(Dec_res,[Decomposition_layers,k-1]);
    output_X=output_X+c_temp';   %С���ع�
end

end

