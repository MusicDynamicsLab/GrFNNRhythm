%% Create figure window
function rhythmUI
hf = figure;
set(hf,'Visible','off','Toolbar','figure','Color',[.8 .8 .8],...
    'Position',[100 100 1200 600],'Name','RhythmUI');
initialRun
movegui(hf,'center')
set(hf,'Visible','on')

%% Initial run
function initialRun
hf = gcf;
handles.hf = hf;

valUI = guidata(handles.hf);
if isempty(valUI)
    valUI.stimulus = 8;
    valUI.model = 6;
end
%% Create panel, dropdown menus, labels, buttons
handles.hp1 = uipanel('Parent',hf,'BackgroundColor',[.8 .8 .8],'Units','Normalized',...
    'Position',[.08 .5 .2 .45]);
s1 = 'Choose the the stimulus';
s2 = 'Choose the model structure \n that will process the rhythm';
handles.dropdownmenu1 = uicontrol('Parent',handles.hp1,'Style','popupmenu',...
    'String','Complexity level 0, Pattern 1','FontSize',11,'Value',valUI.stimulus,...
    'Units','normalized','Position',[.05 .75 .9 .125],'TooltipString', s1);
handles.dropdownmenu2 = uicontrol('Parent',handles.hp1,'Style','popupmenu',...
    'String','One Layer','FontSize',11,'TooltipString', s2,'Value',valUI.model,...
    'Units','normalized','Position',[.05 .45 .9 .125]);
handles.pushbutton1 = uicontrol('Parent',handles.hp1,'Style','pushbutton',...
    'String','Run','Fontsize',15,'Units','normalized','Position',[.05 .05 .45 .3]);
handles.pushbutton2 = uicontrol('Parent',handles.hp1,'Style','pushbutton',...
    'String','Pause','Fontsize',15,'Units','normalized','Position',[.51 .05 .45 .3]);
handles.text1 = uicontrol('Parent',handles.hp1,'Style','text','String','Choose Stimulus',...
  'Units','normalized','Position',[.04 .89 .9 .1],'HorizontalAlignment','left',...
  'FontSize',15,'BackgroundColor',[.8 .8 .8]);
handles.text1 = uicontrol('Parent',handles.hp1,'Style','text','String','Choose Model:',...
  'Units','normalized','Position',[.04 .59 .9 .1],'HorizontalAlignment','left',...
  'FontSize',15,'BackgroundColor',[.8 .8 .8]);

set(handles.dropdownmenu1,'BackgroundColor','white');
complexity = {'Complexity level 0, Pattern 1';...
    'Complexity level 1, Pattern 1';'Complexity level 1, Pattern 2';...
    'Complexity level 2, Pattern 1';'Complexity level 2, Pattern 2';...
    'Complexity level 3, Pattern 1';'Complexity level 3, Pattern 2';...
    'Complexity level 4, Pattern 1';'Complexity level 4, Pattern 2';...
    'Complexity level 4, Pattern 3';'Complexity level 4, Pattern 4';...
    'Random Pattern'};
set(handles.dropdownmenu1, 'String', complexity);
set(handles.dropdownmenu2,'BackgroundColor','white');
rhythmModel = {'One Layer';'One Layer, local connection';'One Layer, harmonic connection';...
               'Two Layer, afferent only';'Two Layer, all, local';'Two Layer, all, harmonic'};
set(handles.dropdownmenu2, 'String', rhythmModel);

%% Create axes
handles.ax5 = axes('Parent',hf,'Units','normalized','Position',[.025 .05 .3 .4],...
    'Visible','off');
handles.ax1 = axes('Parent',hf,'Units','normalized','Position',[.38 .05 .3 .25],...
    'XTick',[],'YTick',[],'box','on'); zoom xon;
handles.ax2 = axes('Parent',hf,'Units','normalized','Position',[.38 .38 .3 .25],...
    'XTick',[],'YTick',[],'box','on');
handles.ax3 = axes('Parent',hf,'Units','normalized','Position',[.38 .72 .3 .25],...
    'XTick',[],'YTick',[],'box','on');
handles.ax4 = axes('Parent',hf','Units','normalized','Position',[.73 .3 .25 .55],...
    'Visible','off');

%% Define callback functions
set(handles.pushbutton1,'Callback',{@runStop,handles})
set(handles.pushbutton2,'Callback',{@pauseResume,handles})

%% RUN button
function runStop(source, ~, handles)
uiresume(handles.hf)
name = get(source,'String');

%% Clear axes
cla(handles.ax1);
set(handles.ax1,'XTick',[],'YTick',[],'box','on');
cla(handles.ax2);
set(handles.ax2,'XTick',[],'YTick',[],'box','on');
cla(handles.ax3);
set(handles.ax3,'XTick',[],'YTick',[],'box','on');
cla(handles.ax4);
set(handles.ax4,'Visible','off');
cla(handles.ax5);
set(handles.ax5,'Visible','off');
cb = findall(gcf,'tag','Colorbar');
delete(cb);
tt = findall(gcf,'type','text');
delete(tt);
set(source,'String','Pause')

stimulusChoice = get(handles.dropdownmenu1, 'Value');
rhythmChoice   = get(handles.dropdownmenu2, 'Value');
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
    case 12
        stimulus = 'randpat.mid';     
end

switch rhythmChoice
    case 1
        handles.image = 'makeRhythm1.png';
        model = 'makeRhythm1';
    case 2
        handles.image = 'makeRhythm1c.png';
        model = 'makeRhythm1c1';
    case 3
        handles.image = 'makeRhythm1c.png';
        model = 'makeRhythm1c3';
    case 4
        handles.image = 'makeRhythm2.png';
        model = 'makeRhythm2';
    case 5
        handles.image = 'makeRhythm2c.png';
        model = 'makeRhythm2c1';
    case 6
        handles.image = 'makeRhythm2c.png';
        model = 'makeRhythm2c3';
end

if strcmp(name,'Run')
    set(source,'String','Clear')
    integrate(stimulus,model,handles);
else
    set(source,'String','Run')
    valUI.stimulus = get(handles.dropdownmenu1,'Value');
    valUI.model    = get(handles.dropdownmenu2,'Value');
    guidata(handles.hf,valUI);
    initialRun;
end
%% Run rhythm function
function integrate(stimulus,rhythm,handles)

%% Parameters
Fs = 100;
alpha1 =  1e-5; beta11 =  0; beta12 = -2; delta11 =  0; delta12 = 0;
neps1 = 1;
alpha2 =  -0.4; beta21 = 1.75; beta22 =-1.25; delta21 = 0; delta22 = 0;
neps2 = 1;
w = 0.4;
lambda =  -1; mu1 = 4; mu2 = -2.2; ceps = 1; kappa = 1; % Critical
ampMult = 0.05;

%% Run simulation
global s M

filename = stimulus;
s = stimulusMake(1, 'mid', filename, [0 32.5], Fs, 'display', 2);

s.x = ampMult*s.x/rms(s.x);
s.x = hilbert(s.x);
disp(filename);
eval(rhythm);
M.s{1}.sAx = handles.ax1;
M.n{1}.nAx = handles.ax2;
if exist('n2','var')
    M.n{2}.nAx = handles.ax3;
else
    axes(handles.ax3);
    cla;
end

axes(handles.ax5);
networkPic = imread(handles.image);
image(networkPic);
set(handles.ax5,'XTick',[],'YTick',[],'box','on');
axis off;
axis image;
axes(handles.ax4);
if exist('C', 'var')
    net1 = getLim(n1);
    net2 = getLim(n1);
    imagesc(net1, net2, abs(C)); colormap(flipud(hot));  
    hcb = colorbar;
    set(hcb,'Location','NorthOutside')
    set(gca, 'XScale', 'Log', 'YScale', 'Log', 'XTick', n1.tick, 'YTick', n1.tick)
    grid on
    xlabel('Frequency of source oscillator (Hz)')
    ylabel('Frequency of target oscillator (Hz)')
    title('Connection Matrix')
end

try
    M = odeRK4fs(M);
catch
    disp('User stopped integration')
    interrupted = 1;
end
set(handles.pushbutton1,'String','Run')
%% Pause button
function pauseResume(source,~,handles)
pauseOrResumeStr = get(source,'String');
if(strcmp(pauseOrResumeStr,'Pause'))    
    set(source,'String','Resume');
    uiwait(handles.hf);
else
    set(source,'String','Pause');
    uiresume(handles.hf);
end
