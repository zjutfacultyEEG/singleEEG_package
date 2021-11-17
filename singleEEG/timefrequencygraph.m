function [t,f_bd,wt_bd] = timefrequencygraph(data,samplingfrequency,scopedata,showornot,saveornot)
% timefrequencygraph,�����Ե��ʱƵͼ
% ����:
% data:�Ե�����
% samplingfrequency:����Ƶ��
% scopedata:��ʾ��Χ
% showornot:�Ƿ���ʾͼ��
% saveornot:�Ƿ񱣴�ͼ��
% ���:
% t:ͼ��ʱ��
% f_bd:ͼ��Ƶ��
% wt_bd:ʱƵ����
if nargin == 2
    scopedata=[0,50];
    showornot=1;
    saveornot=0;
end
if nargin == 3
    showornot=1;
    saveornot=0;
end
if nargin == 4
    saveornot=0;
end
if min(size(data,1),size(data,2))~=1
   warning('������һά���顣')
end
if size(data,1)>size(data,2)
    data=data';
end
if showornot==1
    stemp='on';
elseif showornot==0
    stemp='off';
end
if showornot~=1||showornot~=0
    warning('ָ�����')
end
sp1=scopedata(1);
sp2=scopedata(2);
t=1/samplingfrequency*(1:length(data));
[wt,f,~] = cwt(data,'amor',samplingfrequency);%morse,amor,bump
h = figure('visible',stemp);
loc_f=find(f<sp1);
loc_yu1=length(f)-length(loc_f);
loc_yu2=length(find(f>sp2));
wt_bd=abs(wt(loc_yu1:loc_yu2,:));
wt_bd=wt_bd./max(max(wt_bd,[],2));
f_bd=f(loc_yu1:loc_yu2,:);
pcolor(t,f_bd,wt_bd);
shading interp
set(h,'Units','normalized','Position',[0.1 0.1 0.8 0.8]);
if saveornot==1
[filename, pathname] = uiputfile({'*.png';'*.bmp';'*.jpg'},'ͼƬ����Ϊ');
    if filename ~= 0
        file = strcat(pathname,filename);
        saveas(h,file);
        msgbox('ͼ���ѳɹ�����','ȷ�ϣ�','warn');
    else
        msgbox('������ȡ��','ȷ��','warn');
    end
end
end

