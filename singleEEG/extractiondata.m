function  [Ndatabase,TAG]=extractiondata(file)
% ��ȡ�Ե�����
% ����:
% file:�ļ��������Բ�����
% ���:
% Ndatabase:�Ե�����
% TAG:��ʶ
if nargin==0
    [filename, pathname] = uiputfile({'*.csv';'*.xls'},'ѡ������');
    file = strcat(pathname,filename);
end
temploc=xlsread(file)
Ndatabase=temploc(4,:);
Ndatabase=Ndatabase';
temploc2=dir(file);
TAG=temploc2.name(1:end-4);
end

