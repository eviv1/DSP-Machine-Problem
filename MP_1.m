%% Machine Problem
%{
ECE 21113
AY 24-25
%}

clc % reset Command Window
clear % reset Workspace
close all % close figure windows

%% Initialization
fmax = 5e9; % maximum frequency of the signal
fs = 2*fmax; % sampling frequency
T = 1/fs; % % period
L = 20001; % total number of samples
t = (0:L-1)*T; % converting samples to time domain
deltaf = fs/(L-1); % change in frequency
f = -fs/2:deltaf:fs/2; % range of frequencies

%% Input signal x

% Task 1: Design an input sequence x
x = zeros(1,128); % placeholder only

% ---- Insert your code here

x(1:10) = 1; % generate impulse signal

Sx = fft(x,256); % Fourier Transform for frequency domain 
w = ((0:255)/256)*(fs/2); % frequency axis 

figure(1); % plot figure

subplot(2,1,1) % subplot for input signal in time domain
stem(0:length(x)-1,x,'filled') % create plot
title('Input Sequence (Time Domain)') % add title
xlabel('Sample Index') % add x-axis label
ylabel('Amplitude') % add y-axis label

subplot(2,1,2) % subplot for input signal in frequency domain
plot(w,abs(Sx(1:256))); % create figure 
title('Input Sequence (Frequency Domain)') % add title 
xlabel('Frequency (rad/sample)') % add x-axis label 
ylabel('Amplitude') % add y-axis label

x = transpose(x); % transpose input signal before passing through system

%% Input signal passes through the system

y = transline(x); % given system representing transmission line

%% System Identification

% Task 2: Approximate the magnitude response of the system

% ---- Insert your code here

Sy = fft(y,256); % Fourier Transform for frequency domain 
w = ((0:255)/256)*(fs/2); % frequency axis 

figure(2); % plot figure

subplot(2,1,1) % subplot for output in time domain
stem(0:min(size(y))-1,abs(y),'filled') % create plot
title('Output Sequence (Time Domain)') % add title
xlabel('Sample Index') % add x-axis label
ylabel('Amplitude') % add y-axis label

subplot(2,1,2) % subplot for output in frequency domain
plot(w,abs(Sy(1:256))); % create figure 
title('Output Sequence (Frequency Domain)') % add title 
xlabel('Frequency (rad/sample)') % add x-axis label 
ylabel('Amplitude') % add y-axis label

X = fft(x); % FFT of input signal
Y = fft(y); % FFT of output signal
f = (0:length(X)-1)*(fs/length(X)); % Frequency vector

H = abs(Y) ./ abs(X); % Magnitude response

figure(3); % plot figure

plot(f, abs(H)); % create plot
title('Estimated Magnitude Response of the Transmission Line'); % add title
xlabel('Frequency (rad/sample)'); % add x-axis label
ylabel('Magnitude Response'); % add y-axis label
grid on; % add grid to plot

%% Note:
%{
Plot the signals in time and frequency domain as necessary.
In designing the input sequence, vary parameters to observe trends.
%}