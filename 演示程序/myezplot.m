function varargout = myezplot(varargin)
% MYEZPLOT M-file for myezplot.fig
%      MYEZPLOT, by itself, creates a new MYEZPLOT or raises the existing
%      singleton*.
%
%      H = MYEZPLOT returns the handle to a new MYEZPLOT or the handle to
%      the existing singleton*.
%
%      MYEZPLOT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYEZPLOT.M with the given input arguments.
%
%      MYEZPLOT('Property','Value',...) creates a new MYEZPLOT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myezplot_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myezplot_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myezplot

% Last Modified by GUIDE v2.5 03-Jul-2008 23:38:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myezplot_OpeningFcn, ...
                   'gui_OutputFcn',  @myezplot_OutputFcn, ...
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


% --- Executes just before myezplot is made visible.
function myezplot_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myezplot (see VARARGIN)

% Choose default command line output for myezplot
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes myezplot wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = myezplot_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
F = get(handles.ed_Function,'String');
a = get(handles.ed_From,'String');
a = str2num(a{1});
b = get(handles.ed_To,'String');
b = str2num(b{1});
t = linspace(a,b,100);
F1 = str2func(F{1});
x = F1(t);
plot(handles.axes1,t,x);


function ed_Function_Callback(hObject, eventdata, handles)
% hObject    handle to ed_Function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_Function as text
%        str2double(get(hObject,'String')) returns contents of ed_Function as a double


% --- Executes during object creation, after setting all properties.
function ed_Function_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_Function (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ed_From_Callback(hObject, eventdata, handles)
% hObject    handle to ed_From (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_From as text
%        str2double(get(hObject,'String')) returns contents of ed_From as a double


% --- Executes during object creation, after setting all properties.
function ed_From_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_From (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function ed_To_Callback(hObject, eventdata, handles)
% hObject    handle to ed_To (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ed_To as text
%        str2double(get(hObject,'String')) returns contents of ed_To as a double


% --- Executes during object creation, after setting all properties.
function ed_To_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ed_To (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


