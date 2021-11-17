function  [Ndatabase,TAG]=extractiondata(file)
% 读取脑电数据
% 输入:
% file:文件名，可以不输入
% 输出:
% Ndatabase:脑电数据
% TAG:标识
if nargin==0
    [filename, pathname] = uiputfile({'*.csv';'*.xls'},'选择数据');
    file = strcat(pathname,filename);
end
temploc=xlsread(file)
Ndatabase=temploc(4,:);
Ndatabase=Ndatabase';
temploc2=dir(file);
TAG=temploc2.name(1:end-4);
end

