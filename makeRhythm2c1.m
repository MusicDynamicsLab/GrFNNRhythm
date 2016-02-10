%% Networks
n1 = networkMake(1, 'hopf', alpha1, beta11, beta12, 0,  0,  neps1, ... 
                    'log', .375, 12, 321, 'tick', 2.^(-1:3), ...
                    'display', 2, 'save', 1, 'channel', 1);
n1 = connectAdd(s, n1, 1, 'type', 'active');
n1.con{1}.w = 3.0;

n2 = networkMake(2, 'hopf', alpha2, beta21, beta22,  0, 0, neps2, ...
                    'log', .375, 12, 321, 'tick', 2.^(-1:3), ...
                    'display', 2, 'save', 1, 'channel', 1);
%% Connections
C = connectMake(n1, n1, 'gaus',  1, 1.05);

%% Connections                     

% Internal
n1 = connectAdd(n1, n1, C, 'weight', .10, 'type', '2freq', .05);

% Afferent
n2 = connectAdd(n1, n2, C, 'weight', .40, 'type', '2freq', .05);

% Internal
n2 = connectAdd(n2, n2, C, 'weight', .10, 'type', '2freq', .05);

% Efferent
n1 = connectAdd(n2, n1, C, 'weight', .05, 'type', '2freq', .05);

%% Model                     
M = modelMake(@zdot, @cdot, s, n1, n2);