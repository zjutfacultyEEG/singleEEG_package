function [ Sgup,Sgd ] = enlc( data )
% ��ȡ���°���
% ����:
% data:�Ե�����
% ���:
% Sgup:�ϰ���
% Sgd:�°���

[Sgup,Sgd]=envelope(data,500,'peak');

end

