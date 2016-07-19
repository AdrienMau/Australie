

function varargout = program(varargin)
% PROGRAM MATLAB code for program.fig
%      PROGRAM, by itself, creates a new PROGRAM or raises the existing
%      singleton*.
%
%      H = PROGRAM returns the handle to a new PROGRAM or the handle to
%      the existing singleton*.
%
%      PROGRAM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROGRAM.M with the given input arguments.
%
%      PROGRAM('Property','Value',...) creates a new PROGRAM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before program_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to program_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help program

% Last Modified by GUIDE v2.5 19-Jul-2016 15:23:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @program_OpeningFcn, ...
                   'gui_OutputFcn',  @program_OutputFcn, ...
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
global path2;




% --- Executes just before program is made visible.
function program_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to program (see VARARGIN)
'lancement du programme'
handles.chosen_algorithm=1;
handles.chosen_process=1;
handles.folder_cal='No Path Chosen';
handles.notbusy=1; %If troncature is busy or not during rect

guidata(hObject,handles)
% Choose default command line output for program
handles.output = hObject;

% Update handles structure
guidata(hObject, handles)

% UIWAIT makes program wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = program_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2. CREATION CAL
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.chosen_algorithm==1)
    'Lancement de l''algorithme 1'
elseif(handles.chosen_algorithm==2)
    'Lancement de l''algorithme 2'
elseif(handles.chosen_algorithm==3)
    'Lancement de l''algorithme 3'
else 'Erreur: l''algorithme choisi n''est pas entier';


end


    
% --- Executes on button press in pushbutton3. TRONQUER
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%On se place sur la premiere image


if(handles.notbusy)
    handles.notbusy=0;
    guidata(hObject,handles)
    
    axes(handles.axes1)
    img2=handles.img2;

    imshow(img2)
    rect = round(getrect())

    img2=img2(rect(2):(rect(2)+rect(4)),rect(1):(rect(1)+rect(3)));
    axes(handles.axes1)
    imshow2(img2)

    handles.img2=img2;
    handles.notbusy=1;
    guidata(hObject,handles)
    
end




% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.chosen_algorithm=get(hObject,'Value');
guidata(hObject,handles); %sauvegarde le nouveau handle

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

'box !'

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% Button LOAD
function pushbutton5_Callback(hObject, eventdata, handles)

% handles.folder_cal=uigetdir;
% guidata(hObject,handles); %sauvegarde le nouveau handle
% set(handles.edit2, 'String', handles.folder_cal);
[NomFic,NomEmp] = uigetfile({'*';'*.jpg';'*.png';'*.bmp'},'Choisissez une image') % Choisir une image 
if(NomFic) %if a file has been chosen
    img=imread(strcat(NomEmp,NomFic));
    handles.img=img;
    handles.img2=img;
    handles.NomFic=NomFic;
    guidata(hObject,handles)
    
    axes(handles.axes2)
    imshow(img); title(NomFic);
    path2=NomEmp;
    set(handles.edit2,'String',path2);
end
% guidata(hObject,handles); %sauvegarde le nouveau handle
% set(handles.edit2, 'String', handles.folder_cal);


% edit2_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%TEXT for path
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.folder_cal=get(hObject,'String');

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function pushbutton3_CreateFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function pushbutton5_CreateFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Reset Troncature 
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.img2=handles.img;   
    handles.notbusy=1;
    guidata(hObject,handles)
%     handles.img=img;
%     handles.img2=img;
%     guidata(hObject,handles)
    
    axes(handles.axes1)
    imshow(handles.img); title(handles.NomFic);

