%% Filters design %%
freqArray = [31, 62, 125, 250, 500, 1000, 2000, 4000, 8000,16000];
order = 1024;
fS = 44100;
bBank = CreateFilters(freqArray, order, fS);
%% Filtering of signals %%
[signal, fS] = audioread('songer.mp3');
initB = zeros(1, order);
gain = ones(length(freqArray), 1);
tic
SignalOut = FilteringBanks(signal, bBank, 'filter', gain, initB);
toc
tic
SignalOut = FilteringBanks(signal, bBank, 'fftfilt', gain, initB);
toc
tic
SignalOut = FilteringBanks(signal, bBank, 'convFilter', gain, initB);
toc
