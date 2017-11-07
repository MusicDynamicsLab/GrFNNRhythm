global s M

begin = round((.5:1/s.fs:8.5)*s.fs);
t = s.t(begin(1:end-1));
mf1 = s.x(begin(1:end-1));

figure(03)
nfft = 6*length(mf1);
y = fft(mf1, nfft);
sf = s.fs/2*linspace(0,1,nfft/2+1);
sy= abs(y(1:floor(nfft/2)+1))/nfft;

plot(sf(2:end), sy(2:end)) %
set(gca, 'XLim', [0, 5], 'XTick', [.5 .75 1 1.25 2 4])
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

%%
figure(12);
begin = round((s.t(end)-8:1/s.fs:s.t(end-1))*s.fs);
t = s.t(begin);
mf1 = real(sum(M.n{1}.Z(:,begin)));
x = s.x(begin);

t = t-t(1);
plot(t, real(x)/max(real(x)), 'k', t, real(mf1)/max(real(mf1)), 'c', 'LineWidth', 1.5);

    title('Sensory Network');

%% FFT
figure(13);
nfft = 6*length(mf1);

y = fft((mf1), nfft);
f = s.fs/2*linspace(0,1,nfft/2+1);
ya1= abs(y(1:floor(nfft/2)+1))/nfft;

plot(f(2:end), ya1(2:end)/sum(ya1(2:end)), sf(2:end), sy(2:end)/sum(sy(2:end)))
set(gca, 'XLim', [0, 5], 'XTick', [.5 .75 1 1.25 2 4])
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
    
    t = s.t(begin);
    mf2 = real(mean(M.n{2}.Z(:,begin)));
    x = max(mf2)*s.x(begin);
    
    t = t-t(1);
    plot(t, real(x)/max(real(x)), 'k',t, real(mf2)/max(real(mf2)), 'c', 'LineWidth', 1.5);
        title('Motor Network');

    %% FFT
    figure(23);
        
    y = fft(mf2, nfft);
    f = s.fs/2*linspace(0,1,nfft/2+1);
    ya2= abs(y(1:floor(nfft/2)+1))/nfft;
    
    plot(f(2:end), ya2(2:end)/sum(ya2(2:end)), sf(2:end), sy(2:end)/sum(sy(2:end))) %
    set(gca, 'XLim', [0, 5], 'XTick', [.5 .75 1 1.25 2 4])
    grid
    
    title('Motor Network');
    xlabel('Frequency');
    ylabel('Amplitude');
    
end
