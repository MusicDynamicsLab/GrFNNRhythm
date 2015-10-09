%% Network
n1 = networkMake(1, 'hopf', alpha1, beta11, beta12, delta11, delta12, neps1, ... 
                    'log', .375, 12, 321, ...
                    'display', 2, 'save', 1, 'channel', 1);
n1.w = 3.0;

%% Connections                    
C0 = connectMake(n1, n1, 'gaus',  1, 1.05, 0, 0);

n1 = connectAdd(n1, n1, C0, 'weight', .10, 'type', '2freq', .05);

%% Model                     
M = modelMake(@zdot, @cdot, s, n1);
figure(2); imagesc(M.n{1}.con{1}.C); colormap(flipud(hot)); colorbar;
