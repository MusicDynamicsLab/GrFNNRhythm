%% Parameters
Fs = 48;

alpha1 =  1e-5; beta11 =  0; beta12 = -2; delta11 =  0; delta12 = 0;
neps1 = 1;
alpha2 =  -0.4; beta21 = 1.75; beta22 =-1.25; delta21 = 0; delta22 = 0;
neps2 = 1;
w = 0.4;
% alpha2 =   -1;  beta21 = 4;    beta22 =-2.75; neps2 = 1; w = 1;
lambda =  -1; mu1 = 4; mu2 = -2.2; ceps = 1; kappa = 1; % Critical

ampMult = 0.05;

makeModel = 'makeRhythm2c3';

%% Complexity level 0 (isochronous)
matfilename = sprintf('comp0p1.mat');
filename = sprintf('comp0p1.mid');

s = stimulusMake('mid', filename, [0 24], Fs, ...
                        'display', 4, 'inputType', 'active');
s.x = ampMult*s.x/rms(s.x);
s.x = hilbert(s.x);

disp(filename);
eval(makeModel);
M = odeRK4fs(M, s);
rhythmModelFigures;
save(matfilename)

%% Complexity levels 1, 2 & 3
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

%% Complexity level 4 (missing pulse rhythm)

    for p = [1 2 3 4 5]
        matfilename = sprintf('comp4p%d.mat', p);
        filename = sprintf('comp4p%d.mid', p)

        s = stimulusMake('mid', filename, [0 24.5], Fs, 'inputType', 'active', ...
                        'display', 4, 'inputType', 'active');
        s.x = ampMult*s.x/rms(s.x);
        s.x = hilbert(s.x);
        eval(makeModel);
        M = odeRK4fs(M, s);
        rhythmModelFigures;
        save(matfilename)
    end
