global s M

% comment this line in if you want to read a saved result
load 'comp4p2'

%% EPOCHING and FFT Parameters; Stimulus selection
epochstart = 8.5;               % midifiles start at t = 0.5
epochtime = 4;
estart = find(abs(s.t-epochstart) == min(abs(s.t-epochstart)));
elength = epochtime*s.fs;

EIDX = [];
for start = estart:elength:length(s.t)-1
    eindex = start:start+elength-1;
    EIDX = [EIDX; eindex];
end

t = s.t(EIDX(1,:));
x = real(s.x(EIDX(1,:)));
t = t-t(1);

nfft = 8*length(x);


%% Display Stimulus

figure(03)
y = fft(x, nfft);
sf = s.fs/2*linspace(0,1,nfft/2+1);
sy= abs(y(1:floor(nfft/2)+1))/nfft;

plot(sf(2:end), sy(2:end)) %
set(gca, 'XLim', [0.25, 6], 'XTick', [.5 .75 1 1.25 2 4])
grid

title('Stimulus');
xlabel('Frequency');
ylabel('Amplitude');

%% Display Network 1: Image, mean field time series and FFT

figure(11);
imagesc(s.t, M.n{1}.f, abs(M.n{1}.Z)); axis xy
set(gca, 'xscale', 'lin', 'yscale', 'log');
colormap(flipud(hot)); colorbar;
set(gca, 'CLim', [.001 .8/sqrt(M.n{1}.e)]);
title('Sensory Network');

%% Averaged Time Series
figure(12);
z1 = mean(M.n{1}.Z);
Z1 = z1(EIDX);
z1 = real(mean(Z1));

plot(t, real(x)/max(real(x)), 'k', t, z1/max(z1), 'c', 'LineWidth', 1.5);
title('Sensory Network');

%% FFT
figure(13);

y = fft((z1), nfft);
f = s.fs/2*linspace(0,1,nfft/2+1);
ya1= abs(y(1:floor(nfft/2)+1))/nfft;

plot(f(2:end), ya1(2:end)/sum(ya1(2:end)), sf(2:end), sy(2:end)/sum(sy(2:end)), 'k', ...
        'LineWidth', 1.5) %)
set(gca, 'XLim', [0.25, 6], 'XTick', [.5 .75 1 1.25 2 4])
grid

title('Sensory Network');
xlabel('Frequency');
ylabel('Amplitude');

%% Display Network 2: Image, mean field time series and FFT
if length(M.n)>1
    
    figure(21);
    
    imagesc(s.t, M.n{2}.f, abs(M.n{2}.Z)); axis xy
    set(gca, 'xscale', 'lin', 'yscale', 'log');
    colormap(flipud(hot)); colorbar;
    set(gca, 'CLim', [.001 .8/sqrt(M.n{1}.e)]);
      title('Motor Network');

    %%
    figure(22);

    z2 = mean(M.n{2}.Z);
    Z2 = z2(EIDX);
    z2 = real(mean(Z2));

    plot(t, real(x)/max(real(x)), 'k',t, z2/max(z2), 'c', 'LineWidth', 1.5);
        title('Motor Network');

    %% FFT
    figure(23);
        
    y = fft(z2, nfft);
    f = s.fs/2*linspace(0,1,nfft/2+1);
    ya2= abs(y(1:floor(nfft/2)+1))/nfft;
    
    plot(f(2:end), ya2(2:end)/sum(ya2(2:end)), sf(2:end), sy(2:end)/sum(sy(2:end)), 'k', ...
        'LineWidth', 1.5) %
    set(gca, 'XLim', [0.25, 6], 'XTick', [.5 .75 1 1.25 2 4])
    grid
    
    title('Motor Network');
    xlabel('Frequency');
    ylabel('Amplitude');
    
end

%% Comment these 2 lines in if you want to save the results to the current folder
% parts = strsplit(s.fileName, '.');
% save(parts{1}, 's', 'M', 'f', 'z1', 'ya1', 'z2', 'ya2');

