%% Networks
n1 = networkMake(1, 'hopf', alpha1, beta11, beta12, 0,  0,  neps1, ... 
                    'log', .375, 12, 321, ...
                    'display', 2, 'save', 1, 'channel', 1);
n1.w = 3.0;

n2 = networkMake(2, 'hopf', alpha2, beta21, beta22,  0, 0, neps2, ...
                    'log', .375, 12, 321, ...
                    'display', 2, 'save', 1, 'channel', 1);
%% Connections
C1 = connectMake(n1, n1, 'gaus',  1, 1.05, 0, 1);
C0 = connectMake(n1, n1, 'gaus',  1, 1.05, 0, 0);

%% Connections                     

% Internal
n1 = connectAdd(n1, n1, C0, 'weight', .10, 'type', '2freq');

% Afferent
n2 = connectAdd(n1, n2, C1, 'weight', .40, 'type', '2freq');

% Internal
n2 = connectAdd(n2, n2, C0, 'weight', .10, 'type', '2freq');

% Efferent
n1 = connectAdd(n2, n1, C1, 'weight', .05, 'type', '2freq');

%% Model                     
M = modelMake(@zdot, @cdot, s, n1, n2);
figure(2); imagesc(M.n{1}.con{1}.C); colormap(flipud(hot)); colorbar;
