function varargout = compare(varargin)
% COMPARE MATLAB code for compare.fig
%      COMPARE, by itself, creates a new COMPARE or raises the existing
%      singleton*.
%
%      H = COMPARE returns the handle to a new COMPARE or the handle to
%      the existing singleton*.
%
%      COMPARE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in COMPARE.M with the given input arguments.
%
%      COMPARE('Property','Value',...) creates a new COMPARE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before compare_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to compare_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help compare

% Last Modified by GUIDE v2.5 01-Nov-2017 14:08:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @compare_OpeningFcn, ...
                   'gui_OutputFcn',  @compare_OutputFcn, ...
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


% --- Executes just before compare is made visible.
function compare_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to compare (see VARARGIN)

% Choose default command line output for compare
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes compare wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = compare_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_loadimg1.
function btn_loadimg1_Callback(hObject, eventdata, handles)
% hObject    handle to btn_loadimg1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname]=uigetfile('*.*','Choose an image');
ImageDataA=imread(strcat(pathname,filename));
setappdata(handles.axes1,'ImageDataA',ImageDataA);
axes(handles.axes1);
imshow(ImageDataA);

% --- Executes on button press in btn_loadimg2.
function btn_loadimg2_Callback(hObject, eventdata, handles)
% hObject    handle to btn_loadimg2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname]=uigetfile('*.*','Choose an image');
ImageDataB=imread(strcat(pathname,filename));
setappdata(handles.axes2,'ImageDataB',ImageDataB);
axes(handles.axes2);
imshow(ImageDataB);

% --- Executes on button press in btn_compare.
function btn_compare_Callback(hObject, eventdata, handles)
% hObject    handle to btn_compare (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ImageDataA=getappdata(handles.axes1,'ImageDataA');
ImageDataB=getappdata(handles.axes2,'ImageDataB');
value=xor(ImageDataA,ImageDataB)
imshow(value)

function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
