%% Networks
n1 = networkMake(1, 'hopf', alpha1, beta11, beta12, delta11, delta12, neps1, ... 
                    'log', .375, 12, 321, 'tick', 2.^(-1:3),...
                    'display', 2, 'save', 1, 'channel', 1);
n1.w = 3.0;

%% Connections                     
modes =      [1/3 1/2 1/1 2/1 3/1];
amps  =      [1   1   1   1   1  ]; 
sds   = 1.05*[1   1   1   1   1  ];

C = connectMake(n1, n1, 'gaus',  1, 1.05, 'modes', modes, 'amps', amps, 'sds', sds);

n1 = connectAdd(n1, n1, C, 'weight', .10, 'type', '2freq', .05);

%% Model                     
M = modelMake(@zdot, @cdot, s, n1);
