function varargout = csc11(varargin)
% CSC11 MATLAB code for csc11.fig
%      CSC11, by itself, creates a new CSC11 or raises the existing
%      singleton*.
%
%      H = CSC11 returns the handle to a new CSC11 or the handle to
%      the existing singleton*.
%
%      CSC11('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CSC11.M with the given input arguments.
%
%      CSC11('Property','Value',...) creates a new CSC11 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before csc11_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to csc11_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help csc11

% Last Modified by GUIDE v2.5 06-Nov-2017 17:49:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @csc11_OpeningFcn, ...
                   'gui_OutputFcn',  @csc11_OutputFcn, ...
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


% --- Executes just before csc11 is made visible.
function csc11_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to csc11 (see VARARGIN)

% Choose default command line output for csc11
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes csc11 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = csc11_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_fine.
function btn_fine_Callback(hObject, eventdata, handles)
% hObject    handle to btn_fine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imageDataF = getappdata(handles.axes1,'imageData'); %get image from axes1
[center, radius] = fine(imageDataF);
set(handles.box_xci,'string',num2str(center(1)));
set(handles.box_yci,'string',num2str(center(2)));
set(handles.box_rci,'string',num2str(radius));

% --- Executes on button press in btn_coarse.
function btn_coarse_Callback(hObject, eventdata, handles)
% hObject    handle to btn_coarse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imageDataC = getappdata(handles.axes1,'imageData'); %get image from axes1
[imageDataC,center,radius] = coarse(imageDataC);
imshow(imageDataC);
set(handles.box_xcp,'string',num2str(center(1)));
set(handles.box_ycp,'string',num2str(center(2)));
set(handles.box_rcp,'string',num2str(radius));

% --- Executes on button press in btn_loadimg.
function btn_loadimg_Callback(hObject, eventdata, handles)
% hObject    handle to btn_loadimg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname]=uigetfile('*.*','Choose an image');
imageData=imread(strcat(pathname,filename));
setappdata(handles.axes1,'imageData',imageData);
axes(handles.axes1);
imshow(imageData);


function box_xcp_Callback(hObject, eventdata, handles)
% hObject    handle to box_xcp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of box_xcp as text
%        str2double(get(hObject,'String')) returns contents of box_xcp as a double


% --- Executes during object creation, after setting all properties.
function box_xcp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to box_xcp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function box_ycp_Callback(hObject, eventdata, handles)
% hObject    handle to box_ycp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of box_ycp as text
%        str2double(get(hObject,'String')) returns contents of box_ycp as a double


% --- Executes during object creation, after setting all properties.
function box_ycp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to box_ycp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function box_rcp_Callback(hObject, eventdata, handles)
% hObject    handle to box_rcp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of box_rcp as text
%        str2double(get(hObject,'String')) returns contents of box_rcp as a double


% --- Executes during object creation, after setting all properties.
function box_rcp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to box_rcp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function box_xci_Callback(hObject, eventdata, handles)
% hObject    handle to box_xci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of box_xci as text
%        str2double(get(hObject,'String')) returns contents of box_xci as a double


% --- Executes during object creation, after setting all properties.
function box_xci_CreateFcn(hObject, eventdata, handles)
% hObject    handle to box_xci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function box_yci_Callback(hObject, eventdata, handles)
% hObject    handle to box_yci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of box_yci as text
%        str2double(get(hObject,'String')) returns contents of box_yci as a double


% --- Executes during object creation, after setting all properties.
function box_yci_CreateFcn(hObject, eventdata, handles)
% hObject    handle to box_yci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function box_rci_Callback(hObject, eventdata, handles)
% hObject    handle to box_rci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of box_rci as text
%        str2double(get(hObject,'String')) returns contents of box_rci as a double


% --- Executes during object creation, after setting all properties.
function box_rci_CreateFcn(hObject, eventdata, handles)
% hObject    handle to box_rci (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
