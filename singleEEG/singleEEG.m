function varargout = singleEEG(varargin)
%单通道脑电功能集成界面
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @singleEEG_OpeningFcn, ...
                   'gui_OutputFcn',  @singleEEG_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function singleEEG_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

guidata(hObject, handles);

function varargout = singleEEG_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton1_Callback(hObject, eventdata, handles)
[rileName,PathName]=uigetfile({'*.csv';'*.xls';'*.txt'},'选择数据');
handles.documentlocation=[PathName,rileName];
set(handles.edit1, 'string', handles.documentlocation)
guidata(hObject,handles)



function edit2_Callback(hObject, eventdata, handles)

function edit2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton3_Callback(hObject, eventdata, handles)
handles.filecontent=xlsread(get(handles.edit1,'string'));
handles.data=handles.filecontent(:,4);
s1=get(handles.edit2,'string');
handles.data=handles.data';
handles.V_mid=medfilt1(handles.data,str2double(s1));
guidata(hObject,handles)
s2=get(handles.edit3,'string');
handles.idt=(1:length(handles.V_mid))./str2double(s2);
guidata(hObject,handles)
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
axes(handles.axes1)
s2=get(handles.edit3,'string');
handles.idt=(1:length(handles.V_mid))./str2double(s2);
plot(handles.idt,handles.V_mid)
guidata(hObject,handles)


function edit4_Callback(hObject, eventdata, handles)
function edit4_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)

function edit5_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton5_Callback(hObject, eventdata, handles)

handles.Vl=Extract_band(handles.V_mid,get(handles.edit4,'string'),get(handles.edit5,'string'));
guidata(hObject,handles)


function pushbutton6_Callback(hObject, eventdata, handles)

axes(handles.axes2)
plot(handles.idt,handles.Vl)



function pushbutton7_Callback(hObject, eventdata, handles)

handles.middl=uigetdir('C:\','储存');
set(handles.edit6, 'string', [handles.middl,'\Vmid.mat'])
guidata(hObject,handles)
V_mid=handles.V_mid;
loc=get(handles.edit6,'string');
if loc~= 0
    save(loc,'V_mid')
    msgbox('数据已成功保存','确认！','warn');
else
    msgbox('操作已取消','确认','warn');
end
function edit6_Callback(hObject, eventdata, handles)

function edit6_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton8_Callback(hObject, eventdata, handles)

handles.middl=uigetdir('C:\','储存');
set(handles.edit7, 'string', [handles.middl,'\Vl.mat'])
guidata(hObject,handles)
Vl=handles.Vl;
loc=get(handles.edit7,'string');
save(loc,'Vl')
if loc ~= 0
    save(loc,'Vl')
    msgbox('数据已成功保存','确认！','warn');
else
    msgbox('操作已取消','确认','warn');
end
function edit7_Callback(hObject, eventdata, handles)

function edit7_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
h = figure('visible','off');
name_S=get(handles.edit9,'string');
eval(['new_axes = copyobj(handles.axes',name_S,',h);'])
set(new_axes,'Units','normalized','Position',[0.1 0.1 0.8 0.8]);
[filename, pathname] = uiputfile({'*.png';'*.bmp';'*.jpg'},'图片保存为');
set(handles.edit8,'string',[pathname, filename])
if filename ~= 0
    file = strcat(pathname,filename);
    saveas(h,file);
    msgbox('图像已成功保存','确认！','warn');
else
    msgbox('操作已取消','确认','warn');
end


function edit8_Callback(hObject, eventdata, handles)




function edit8_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function pushbutton10_Callback(hObject, eventdata, handles)

[handles.up,handles.dowm]=envelope(handles.Vl,500,'peak');
guidata(hObject,handles)


function pushbutton11_Callback(hObject, eventdata, handles)

axes(handles.axes2)
hold on
plot(handles.idt,handles.up)
hold on
plot(handles.idt,handles.dowm)
guidata(hObject,handles)


function pushbutton12_Callback(hObject, eventdata, handles)

s2=get(handles.edit3,'string');
[wt,f,~] = cwt(handles.V_mid,'amor',str2double(s2));
loc_f=find(f<50);
loc_yu=length(f)-length(loc_f);
wt_bd=abs(wt(loc_yu:size(wt,1),:));
wt_bd=wt_bd./max(max(wt_bd,[],2));
f_bd=f(loc_yu:size(wt,1),:);
axes(handles.axes3)
pcolor(handles.idt,f_bd,wt_bd);
shading interp
