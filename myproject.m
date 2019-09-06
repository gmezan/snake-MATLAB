function varargout = myproject(varargin)
% MYPROJECT MATLAB code for myproject.fig
%      MYPROJECT, by itself, creates a new MYPROJECT or raises the existing
%      singleton*.
%
%      H = MYPROJECT returns the handle to a new MYPROJECT or the handle to
%      the existing singleton*.
%
%      MYPROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MYPROJECT.M with the given input arguments.
%
%      MYPROJECT('Property','Value',...) creates a new MYPROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before myproject_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to myproject_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help myproject

% Last Modified by GUIDE v2.5 09-Feb-2019 11:05:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @myproject_OpeningFcn, ...
                   'gui_OutputFcn',  @myproject_OutputFcn, ...
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
%-------------------------------------------------------------------------------------------------------------------


% --- Executes just before myproject is made visible.
function myproject_OpeningFcn(hObject, eventdata, handles, varargin)
global  myicon 
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to myproject (see VARARGIN)


% Choose default command line output for myproject
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


myicon = imread('matlab.jpg');
% UIWAIT makes myproject wait for user response (see UIRESUME)
 %uiwait(handles.figure1);

set(handles.pushbutton2,"Enable","off");
set(handles.pushbutton4,"Enable","off");

uiwait(msgbox('Welcome','Hi!','custom',myicon));

 



% --- Outputs from this function are returned to the command line.
function [varargout] = myproject_OutputFcn(hObject, eventdata, handles) 
global mychoice myicon username ps mode
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure

axes(handles.axes1)
imshow(myicon);
axis off;
axes(handles.axes2)
imshow(myicon)
axis off;
mychoice = menu('Choose one','Snake','Tetris');
disp(mychoice);
if mychoice ~= 0
    set(handles.axes1);
    imshow(zeros(10,10));
end
switch mychoice
    case 1
        x = "Snake";
    case 2
        x = "Tetris";
end
set(handles.text2,"String",x);

mode = menu("Elige el modo","mando","kb");

if mode == 1
    uiwait(msgbox("Connectar mando y dar a ok"));
    while 1
        [x , ps] = uc_config();
        if x ==0
            break
        end
    end
end

set(handles.pushbutton5,"Visible","on");
set(handles.edit1,"Visible","on");
set(handles.text10,"Visible","on");
set(handles.pushbutton5,"Visible","on");
set(handles.text9,"Visible","on");


varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --------------------------------------------------------------------
function uipanel1_ButtonDownFcn(hObject, ~, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in pushbutton1. RESET BUTTON
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of pushbutton1
clc;
clear all;
close all;
myproject;

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton1.
function pushbutton1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.o
function text2_CreateFcn(hObject, eventdata, handles)
global mychoice
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




        

% -------------START BUTTON--------------------------------------
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
global ps mode mychoice
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.pushbutton4,"Enable","off");
if mychoice ==1
    if mode == 1
        snake(handles.axes1,handles.axes2, ps, handles.text11, handles.text12,handles.text13,handles.text6,handles.text8);
        fclose(ps); 
        delete(ps);
    else 
        snake_kb(handles.axes1,handles.axes2,handles.text11, handles.text12,handles.text13,handles.text6,handles.text8);
    end
else 
    uiwait(msgbox("Tetris aun no programado"));
end
cla(handles.axes1,'reset');
axes(handles.axes1);
axis off;
clear myproject;
clear all;
close all;
clc;




% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)  %% USERNAMEM
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text6_CreateFcn(hObject, eventdata, handles) %% CURRENT SCORE
% hObject    handle to text6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text8_CreateFcn(hObject, eventdata, handles) %% MAX SCORE
% hObject    handle to text8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global username
username = get(handles.edit1,"String");

set(handles.pushbutton2,"Enable","on");
set(handles.pushbutton4,"Enable","on");

set(handles.pushbutton5,"Visible","off");
set(handles.edit1,"Visible","off");
set(handles.text10,"Visible","off");
set(handles.pushbutton5,"Visible","off");
set(handles.text9,"Visible","off");


set(handles.text4,"Visible","on");
set(handles.text6,"Visible","on");
set(handles.text8,"Visible","on");
set(handles.text4, "String", username ); % my name
set(handles.text6, "String", "0" ); %My current score
set(handles.text8, "String", "0" ); %max score ------------------need it!!


% --- Executes during object creation, after setting all properties.
function text10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on mouse press over axes background.
function axes1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes during object creation, after setting all properties.
function text13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
