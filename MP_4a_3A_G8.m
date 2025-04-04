%% ECE21113L 3ECE-A MP Group8; Item 4a

% Parameters
fs = 8000;           % Sampling frequency in Hz
N = 256;             % DFT size
f_low = 852;         % Low frequency (row frequency for '9')
f_high = 1477;       % High frequency (column frequency for '9')

% Generate the DTMF signal for button '9'
t = (0:N-1) / fs;    % Time vector for 256 samples
signal = sin(2*pi*f_low*t) + sin(2*pi*f_high*t);  % Combined DTMF signal

% Apply a windowing function (Hamming window)
window = hamming(N)';
windowed_signal = signal .* window;

% Compute the 256-point DFT
dft_signal = fft(windowed_signal, N);

% Compute the amplitude spectrum
amplitude_spectrum = abs(dft_signal);

% Find the peak indices
[~, k_low] = max(amplitude_spectrum(1:N/2)); % Search for low frequency
k_high = round(f_high * N / fs);            % Compute high-frequency index manually

% Output results
fprintf('Peak frequency indices:\n');
fprintf('Low frequency (852 Hz): Index %d\n', k_low);
fprintf('High frequency (1477 Hz): Index %d\n', k_high);

% Plot the amplitude spectrum
frequencies = (0:N-1) * (fs / N);           % Frequency vector
plot(frequencies, amplitude_spectrum);
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Amplitude Spectrum of the DTMF Signal');
grid on;
