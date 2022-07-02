function varargout = tfviewer(varargin)
% TFVIEWER M-file for tfviewer.fig
%      TFVIEWER, by itself, creates a new TFVIEWER or raises the existing
%      singleton*.
%
%      H = TFVIEWER returns the handle to a new TFVIEWER or the handle to
%      the existing singleton*.
%
%      TFVIEWER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TFVIEWER.M with the given input arguments.
%
%      TFVIEWER('Property','Value',...) creates a new TFVIEWER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before tfviewer_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to tfviewer_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help tfviewer

% Last Modified by GUIDE v2.5 16-Aug-2007 21:56:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @tfviewer_OpeningFcn, ...
                   'gui_OutputFcn',  @tfviewer_OutputFcn, ...
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
% End initialization code - DO NOT EDIT


% --- Executes just before tfviewer is made visible.
function tfviewer_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to tfviewer (see VARARGIN)

% Choose default command line output for tfviewer
handles.output = hObject;

handles.Time = [];
handles.Data = [];
handles.FreqSampleNum = 100;
handles.FreqRange = [-10,10];
set(handles.ed_FreqSampleNum,'String',num2str(handles.FreqSampleNum));
set(handles.ed_FreqRange,'String',num2str(handles.FreqRange));

% Update handles structure
guidata(hObject, handles);


RefreshVariables(handles);

set(handles.bt_Draw,'Enable','off');


% UIWAIT makes tfviewer wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = tfviewer_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function lst_Variables_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lst_Variables (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_Refresh.
function bt_Refresh_Callback(hObject, eventdata, handles)
% hObject    handle to bt_Refresh (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

RefreshVariables(handles);

% --- Executes on button press in bt_SetSampleTime.
function bt_SetSampleTime_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetSampleTime (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Time = getVariableSel(handles);
guidata(hObject,handles);

if (isempty(handles.Time)|isempty(handles.Data))
    E = 'off';
else
    E = 'on';
end
set(handles.bt_Draw,'Enable',E);

% --- Executes on button press in bt_SetSampleData.
function bt_SetSampleData_Callback(hObject, eventdata, handles)
% hObject    handle to bt_SetSampleData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.Data = getVariableSel(handles);
guidata(hObject,handles);

if (isempty(handles.Time)|isempty(handles.Data))
    E = 'off';
else
    E = 'on';
end
set(handles.bt_Draw,'Enable',E);

function ed_FreqRange_Callback(hObject, eventdata, handles)
% hObject    handle to ed_FreqRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_FreqRange as text
%        str2double(get(hObject,'String')) returns contents of ed_FreqRange as a double
handles.FreqRange = str2num(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function ed_FreqRange_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_FreqRange (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_FreqSampleNum_Callback(hObject, eventdata, handles)
% hObject    handle to ed_FreqSampleNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_FreqSampleNum as text
%        str2double(get(hObject,'String')) returns contents of ed_FreqSampleNum as a double
handles.FreqSampleNum = str2num(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function ed_FreqSampleNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_FreqSampleNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in bt_Draw.
function bt_Draw_Callback(hObject, eventdata, handles)
% hObject    handle to bt_Draw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

t = evalin('base',handles.Time);
x = evalin('base',handles.Data);
plot(handles.ax_Time,t,x);
axis tight;

N = length(t);
t = reshape(t,N,1);
T = (max(t)-min(t))/(N-1)*N;
OMGrg = str2num(get(handles.ed_FreqRange,'String'));
OMG = OMGrg(2)-OMGrg(1);
K = str2num(get(handles.ed_FreqSampleNum,'String'));
omg = linspace(OMGrg(1),OMGrg(2)-OMG/K,K)';
FT = T/N*exp(-j*kron(omg,t.'));

X = FT*x.';
plot(handles.ax_Freq,omg,abs(X));
axis tight;

function RefreshVariables(handles)
vars = evalin('base','who');
set(handles.lst_Variables,'String',vars);

function var = getVariableSel(handles)
vars = get(handles.lst_Variables,'String');
idx = get(handles.lst_Variables,'Value'); 
var = vars{idx(1)};
