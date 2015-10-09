%% Parameters
Fs = 48;

alpha1 =  0.00001; beta11 =  0; beta12 = -2; delta11 =  0; delta12 = 0;
neps1 = 1;
alpha2 =  -0.4; beta21 = 1.75; beta22 =-1.25; delta21 = 0; delta22 = 0;
neps2 = 1;
w = 0.4;
% alpha2 =   -1;  beta21 = 4;    beta22 =-2.75; neps2 = 1; w = 1;
lambda =  -1; mu1 = 4; mu2 = -2.2; ceps = 1; kappa = 1; % Critical

ampMult = 0.05;

makeModel = 'makeRhythm2c1p';

%% isochronous
matfilename = sprintf('iso44long.mat');
filename = sprintf('iso44long.mid');

s = stimulusMake('mid', filename, [0 24], Fs, ...
                        'display', 4, 'inputType', 'active');
s.x = ampMult*s.x/rms(s.x);
s.x = hilbert(s.x);

disp(filename);
eval(makeModel);
M = odeRK4fs(M, s);
rhythmModelFigures;
save(matfilename)

%% complexity levels 1, 2 & 3
for c = [1 2 3]
    for p = [1 2]
        matfilename = sprintf('comp%dp%d.mat', c, p);
        filename = sprintf('comp%dp%d.mid', c, p)

        s = stimulusMake('mid', filename, [0 24.5], Fs, 'inputType', 'active', ...
                        'display', 4, 'inputType', 'active');
        s.x = ampMult*s.x/rms(s.x);
        s.x = hilbert(s.x);
                
        eval(makeModel);
        M = odeRK4fs(M, s);
        rhythmModelFigures;
        save(matfilename)
    end
end


%% missing pulse patterns
for p = [1 2 3 5]

    matfilename = sprintf('p%dlong.mat', p);
    
    filename = sprintf('p%dlong.mid', p)


    s = stimulusMake('mid', filename, [0 48.5], Fs, 'inputType', 'active', ...
                        'display', 4, 'inputType', 'active');
    s.x = ampMult*s.x/rms(s.x);
    s.x = hilbert(s.x);
    
    disp(filename);
    eval(makeModel);
    M = odeRK4fs(M, s);
    rhythmModelFigures
    save(matfilename)
    
end


