%% Network
n1 = networkMake(1, 'hopf', alpha1, beta11, beta12, delta11, delta12, neps1, ... 
                    'log', .375, 12, 321, 'tick', 2.^(-1:3), ...
                    'display', 2, 'save', 1, 'channel', 1);
n1.con{1}.w = 3.0;

%% Model                     
M = modelMake(@zdot, @cdot, s, n1);