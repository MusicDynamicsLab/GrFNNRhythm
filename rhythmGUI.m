function varargout = rhythmGUI(varargin)
% RHYTHMGUI MATLAB code for rhythmGUI.fig
%      RHYTHMGUI, by itself, creates a new RHYTHMGUI or raises the existing
%      singleton*.
%
%      H = RHYTHMGUI returns the handle to a new RHYTHMGUI or the handle to
%      the existing singleton*.
%
%      RHYTHMGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RHYTHMGUI.M with the given input arguments.
%
%      RHYTHMGUI('Property','Value',...) creates a new RHYTHMGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rhythmGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rhythmGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rhythmGUI

% Last Modified by GUIDE v2.5 24-Nov-2015 17:00:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rhythmGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @rhythmGUI_OutputFcn, ...
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

% --- Executes just before rhythmGUI is made visible.
function rhythmGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rhythmGUI (see VARARGIN)

% Choose default command line output for rhythmGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% This sets up the initial plot - only do when we are invisible
% so window can get raised using rhythmGUI.
if strcmp(get(hObject,'Visible'),'off')
    set(handles.axes1,'XTick',[],'YTick',[],'box','on',...
         'DataAspectRatioMode', 'auto', 'PlotBoxAspectRatioMode', 'auto',...
         'CameraViewAngleMode', 'auto')
    set(handles.axes2,'XTick',[],'YTick',[],'box','on',...
         'DataAspectRatioMode', 'auto', 'PlotBoxAspectRatioMode', 'auto',...
         'CameraViewAngleMode', 'auto')
    set(handles.axes3,'XTick',[],'YTick',[],'box','on',...
         'DataAspectRatioMode', 'auto', 'PlotBoxAspectRatioMode', 'auto',...
         'CameraViewAngleMode', 'auto')
    set(handles.axes4,'XTick',[],'YTick',[],'box','on')
    set(handles.axes5,'XTick',[],'YTick',[],'DataAspectRatioMode', 'auto',...
        'PlotBoxAspectRatioMode', 'auto','CameraViewAngleMode', 'auto')
end

% Create tooltipstrings (i.e. hover for description) for stimulus and model
s1 = sprintf('Choose the the stimulus');
set(handles.text1, 'TooltipString', s1);
set(handles.popupmenu1, 'TooltipString', s1);
s2 = sprintf('Choose the model structure \n that will process the rhythm');
set(handles.text2, 'TooltipString', s2);
set(handles.popupmenu2, 'TooltipString', s2);
set(handles.uipanel1, 'BackgroundColor', get(gcf,'Color'))
set(handles.text1, 'BackgroundColor', get(gcf,'Color'))
set(handles.text2, 'BackgroundColor', get(gcf,'Color'))



% --- Outputs from this function are returned to the command line.
function varargout = rhythmGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- RUN button
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.axes1);
set(handles.axes1,'XTick',[],'YTick',[],'box','on');
cla(handles.axes2);
set(handles.axes2,'XTick',[],'YTick',[],'box','on');
cla(handles.axes3);
set(handles.axes3,'XTick',[],'YTick',[],'box','on');
cla(handles.axes4);
set(handles.axes4,'XTick',[],'YTick',[],'box','on');
cla(handles.axes5);
set(handles.axes5,'XTick',[],'YTick',[],'box','on');
cb = findall(gcf,'tag','Colorbar');
delete(cb);
tt = findall(gcf,'type','text');
delete(tt);

stimulusChoice = get(handles.popupmenu1, 'Value');
rhythmChoice   = get(handles.popupmenu2, 'Value');
switch stimulusChoice
    case 1
        stimulus = 'comp0p1.mid';
    case 2
        stimulus = 'comp1p1.mid';
    case 3
        stimulus = 'comp1p2.mid';
    case 4
        stimulus = 'comp2p1.mid';
    case 5
        stimulus = 'comp2p2.mid';
    case 6
        stimulus = 'comp3p1.mid';
    case 7
        stimulus = 'comp3p2.mid';
    case 8
        stimulus = 'comp4p1.mid';
    case 9
        stimulus = 'comp4p2.mid';
    case 10
        stimulus = 'comp4p3.mid';
    case 11
        stimulus = 'comp4p5.mid';
        
end

switch rhythmChoice
    case 1
        handles.image = 'makeRhythm1.png';
        runRhythm(stimulus,'makeRhythm1', handles);
    case 2
        handles.image = 'makeRhythm1c.png';
        runRhythm(stimulus,'makeRhythm1c1', handles);
    case 3
        handles.image = 'makeRhythm1c.png';
        runRhythm(stimulus,'makeRhythm1c3', handles);
    case 4
        handles.image = 'makeRhythm2.png';
        runRhythm(stimulus,'makeRhythm2', handles);
    case 5
        handles.image = 'makeRhythm2c.png';
        runRhythm(stimulus,'makeRhythm2c1', handles);
    case 6
        handles.image = 'makeRhythm2c.png';
        runRhythm(stimulus,'makeRhythm2c3', handles);
end

% --- PAUSE button
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
pause;

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1

function popupmenu2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

set(hObject,'BackgroundColor','white');
complexity = {'Complexity level 0, Pattern 1';...
    'Complexity level 1, Pattern 1';'Complexity level 1, Pattern 2';...
    'Complexity level 2, Pattern 1';'Complexity level 2, Pattern 2';...
    'Complexity level 3, Pattern 1';'Complexity level 3, Pattern 2';...
    'Complexity level 4, Pattern 1';'Complexity level 4, Pattern 2';...
    'Complexity level 4, Pattern 3';'Complexity level 4, Pattern 4'};
set(hObject, 'String', complexity);

% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

set(hObject,'BackgroundColor','white');
rhythmModel = {'One Layer';'One Layer, local connection';'One Layer, harmonic connection';...
               'Two Layer, afferent only';'Two Layer, afferent, local';'Two layer, afferent, harmonic'};
set(hObject, 'String', rhythmModel);

function y = runRhythm(stimulus, rhythm, handles)

%% Parameters
Fs = 48;
alpha1 =  1e-5; beta11 =  0; beta12 = -2; delta11 =  0; delta12 = 0;
neps1 = 1;
alpha2 =  -0.4; beta21 = 1.75; beta22 =-1.25; delta21 = 0; delta22 = 0;
neps2 = 1;
w = 0.4;
lambda =  -1; mu1 = 4; mu2 = -2.2; ceps = 1; kappa = 1; % Critical
ampMult = 0.05;

%% Run simulation
filename = stimulus;
s = stimulusMake('mid', filename, [0 48.5], Fs, 'display', 4, 'inputType', 'active');
s.x = ampMult*s.x/rms(s.x);
s.x = hilbert(s.x);
disp(filename);
eval(rhythm);
s.sAx = handles.axes1;
M.n{1}.nAx = handles.axes2;
if exist('n2','var')
    M.n{2}.nAx = handles.axes3;
else
    axes(handles.axes3);
    cla;
end

axes(handles.axes5);
[networkPic, map, alpha] = imread(handles.image);
imagesc(networkPic,'AlphaData',alpha);
set(handles.axes5,'XTick',[],'YTick',[],'box','on');
axis off;
axis image;
axes(handles.axes4);
if exist('C', 'var')
    net1 = getLim(n1);
    net2 = getLim(n1);
    imagesc(net1, net2, abs(C)); colormap(flipud(hot));  colorbar;
    set(gca, 'XScale', 'Log', 'YScale', 'Log', 'XTick', n1.tick, 'YTick', n1.tick)
    grid on
    xlabel('Frequency of source oscillator (Hz)')
    ylabel('Frequency of target oscillator (Hz)')
    title('Connection Matrix')
end
M = odeRK4fs(M, s);
