begin = round((.5:1/s.fs:8.5)*s.fs);
t = s.t(begin);
mf = s.x(begin);

figure(03)
% set(gcf, 'Position', [100        1170         525         175])
nfft = length(mf);
y = fft((mf), nfft);
f = s.fs/2*linspace(0,1,nfft/2);
yas= abs(y(1:floor(nfft/2)))/nfft;

plot(f(2:end), yas(2:end)) %
set(gca, 'XLim', [0, 9]) % 9 is index 72

title('Stimulus');
xlabel('Frequency');
ylabel('Amplitude');

%% Display Network 1: Image, mean field time series and FFT

figure(11);
    
    imagesc(s.t, M.n{1}.f, abs(M.n{1}.Z)); axis xy
    set(gca, 'xscale', 'lin', 'yscale', 'log');
    colormap(flipud(hot)); colorbar;
    set(gca, 'CLim', [.001 .8/sqrt(M.n{1}.e)]);
 
%%
figure(12);
% set(gcf, 'Position', [600        1071         850         275])
begin = round((s.t(end)-8:1/s.fs:s.t(end))*s.fs);
% begin = round((.5:1/s.fs:8.5)*s.fs);
t = s.t(begin);
mf = real(sum(M.n{1}.Z(:,begin)));
x = s.x(begin);

t = t-t(1);
plot(t, real(x)/max(real(x)), 'k', t, real(mf)/max(real(mf)), 'c', 'LineWidth', 1.5);

%% FFT

figure(13);
% set(gcf, 'Position', [100        940         525         175])

nfft = length(mf);

y = fft((mf), nfft);
f = s.fs/2*linspace(0,1,nfft/2);
ya= abs(y(1:floor(nfft/2)))/nfft;

plot(f(2:end), ya(2:end)/sum(ya(2:end)))
set(gca, 'XLim', [0, 9])

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
  
    %%
    figure(22);
    % set(gcf, 'Position', [600        720         850         275])
    
    idx = find(abs(M.n{2}.Z(:,end-1)) > .5);
    % idx=190:196;
    
    begin = round((s.t(end)-8:1/s.fs:s.t(end))*s.fs);
    t = s.t(begin);
    mf = real(mean(M.n{2}.Z(:,begin)));
    x = max(mf)*s.x(begin);
    
    t = t-t(1);
    plot(t, real(x)/max(real(x)), 'k',t, real(mf)/max(real(mf)), 'c', 'LineWidth', 1.5);
    
    %% FFT
    figure(23);
    % set(gcf, 'Position', [100        710         525         175])
    
    nfft = length(mf);
    
    y = fft((mf), nfft);
    f = s.fs/2*linspace(0,1,nfft/2);
    ya= abs(y(1:floor(nfft/2)))/nfft;
    
    plot(f(2:end), ya(2:end)/sum(ya(2:end))) %
    set(gca, 'XLim', [0, 9])
    
    title('Motor Network');
    xlabel('Frequency');
    ylabel('Amplitude');
    
end
