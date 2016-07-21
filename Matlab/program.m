% taux_dot_mag=109590;

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

% Last Modified by GUIDE v2.5 20-Jul-2016 17:00:21

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


    
% --- Executes on button press in pushbutton_tronc. TRONQUER
function pushbutton_tronc_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_tronc (see GCBO)
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

figure
imshow(imread('C:\Users\Adrien\Pictures\clem je lapine3.png'))

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% Button LOAD
function pushbutton_loadpath_Callback(hObject, eventdata, handles)

% handles.folder_cal=uigetdir;
% guidata(hObject,handles); %sauvegarde le nouveau handle
% set(handles.edit_path, 'String', handles.folder_cal);
[NomFic,NomEmp] = uigetfile({'*';'*.jpg';'*.png';'*.bmp'},'Choisissez une image'); % Choisir une image 
if(NomFic) %if a file has been chosen
    img=(imread(strcat(NomEmp,NomFic)));
    s=size(img)
    if exist('s(3)','var')
        img=rgb2gray(img(:,:,1:3)); % 1:3 because of problem with tiff image, fourth dimension exist with only 255 in it
    end
    
    
    handles.img=img;
    handles.img2=img;
    handles.NomFic=NomFic;
    guidata(hObject,handles)

    %display image
    axes(handles.axes2)
    imshow(img); title(NomFic);
    axes(handles.axes1)
    imshow(img)
    
    %Path
    path2=NomEmp;
    set(handles.edit_path,'String',path2);
end
% guidata(hObject,handles); %sauvegarde le nouveau handle
% set(handles.edit_path, 'String', handles.folder_cal);


% edit2_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton_loadpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%TEXT for path
function edit_path_Callback(hObject, eventdata, handles)
% hObject    handle to edit_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.folder_cal=get(hObject,'String');

% Hints: get(hObject,'String') returns contents of edit_path as text
%        str2double(get(hObject,'String')) returns contents of edit_path as a double


% --- Executes during object creation, after setting all properties.
function edit_path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




function pushbutton_tronc_CreateFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton_loadpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


function pushbutton_loadpath_CreateFcn(hObject, eventdata, handles)

% hObject    handle to pushbutton_loadpath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Reset Troncature 
function pushbutton_reset_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.img2=handles.img;   
    handles.notbusy=1;
    guidata(hObject,handles)
%     handles.img=img;
%     handles.img2=img;
%     guidata(hObject,handles)
    
    axes(handles.axes1)
    imshow(handles.img);



%USER GIVE THE MAGNIFICATION
function edit_mag_Callback(hObject, eventdata, handles)
% hObject    handle to edit_mag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

magnif=str2double(get(hObject,'String'));
if isnan(magnif) %not va valid number
    set(handles.edit_mag,'String','x');
    handles.pixelrate=0;
    set(hObject,'BackgroundColor','red')
    set(handles.text_taux,'String','Maybe try a number?');
else %set new magnification , and new pixelrate
    handles.magnification=str2double(get(hObject,'String'));
    handles.pixelrate=109590/magnif; %on Image: 1pix = pixelrate nm
    set(handles.text_taux,'String',strcat('1 Pix=',num2str(round(109590/magnif,3)),'nm'));
    set(hObject,'BackgroundColor','white')
    pause(0.05)
    set(hObject,'BackgroundColor','green')
end
guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function edit_mag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_mag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','red');
end


% --- APPROXGAUSS
function pushbutton_gauss_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_gauss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img2=handles.img2;
size(img2)
histo=mean(img2); %histogram of image
figure
plot(histo);
hold on
x=1:length(histo);
p=fit_gauss_2(x,histo);
fit=p(1)+p(2)*exp(-((x-p(3)).^2)./(2*p(4)*p(4)));
plot(fit)
error=histo-fit;
mean_square_error=error*error';

%set title (in nm if pixelrate has been defined, else in pixels)
try
    title(['Gaussian fit: FWHM=',num2str(2.355*p(4)*handles.pixelrate),'nm   Error=',num2str(round(mean_square_error))])
catch
    title(['Gaussian fit: FWHM=',num2str(2.355*p(4)),'pix   Error=',num2str(round(mean_square_error))])
end



%FWHM -ie half maximum width- is sqrt(ln(256))*sigma so approximately 2.355*sigma

% imgauss=p0(1)+p0(2)*exp(-(( x-p0(3)).^2+(y-p0(4)).^2)/(2*p0(5)^2));
% imshow(imgauss);

% --- Executes on button press in pushbutton_manual.
%User choose two points and receive the distance in nm between them.
function pushbutton_manual_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_manual (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

try   % will check if pixelrate has been defined (by entering magnification)
    if(handles.pixelrate) 
    end
    axes(handles.axes1)
    rect = round(getrect());
    distance=sqrt(rect(3)*rect(3)+rect(4)*rect(4)) %in pixel
    distance=distance*handles.pixelrate; %in nm
    title(['distance = ',num2str(distance),' nm']);
    handles.distance=distance;
    guidata(hObject,handles)
catch       %pixelrate not defined
    axes(handles.axes1)
    title(['Please Set Magnification !']);
end



