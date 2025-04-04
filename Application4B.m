%% Inputting of DTMF audio

[audio, fs] = audioread('touchtone.wav');
sound(audio,fs)

%% Initializing keypad
%row / low frequencies keypad
row = [697, 770, 852, 941]; 

%column / high frequencies keypad
column = [1209, 1336, 1477, 1633]; 

%keypad buttons
buttons = ['1', '2', '3', 'A'; '4', '5', '6', 'B'; '7', '8', '9', 'C'; '*', '0', '#', 'D'];

%% Plotting the input DTMF audio in Frequency Domain

% Plot of the input signal in frequency domain
L = length(audio);
f = (0:L-1)*(fs/L);
fft_audio = abs(fft(audio));

L=floor(L/2);

figure;
plot(f(1:L), fft_audio(1:L));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Frequency domain of touchtone.wav');
xlim([0 1800]);
ylim([0 100]);

%% Initializing the Goertzel algorithm

frequencies = [row, column];

% Frame size captured in samples
N = 0.21 * fs; 

% Normalizing frequencies & equation of Goertzel
k = (frequencies / fs * N);
coeffiecient = 2 * cos(2 * pi * k / N);

% Initialize the keypand
decoded = '';

% Analyze audio frame by frame
for i = 1:N:(length(audio) - N)
    % The current frame
    current_frame = audio(i:i + N - 1); 
    magnitude = zeros(size(frequencies)); 

    % Using the Goertzel algorithm
    for freq_idx = 1:length(frequencies)
        prev_value = 0; 
        prev_value2 = 0; 
        
        for sample = (current_frame)'
            current_value = sample + coeffiecient(freq_idx) * prev_value - prev_value2;
            prev_value2 = prev_value;
            prev_value = current_value;
        end
        magnitude(freq_idx) = (prev_value2).^2 + (prev_value).^2 - coeffiecient(freq_idx) * prev_value * prev_value2;
    end


    % Detect keypad used
    [~, row_key] = max(magnitude(1:4));
    [~, col_key] = max(magnitude(5:8));

    % Append detected key
    decoded = [decoded, buttons(row_key, col_key)];
end


%% Display decoded keypad sequence

disp('Decoded keypad sequence: ');
disp(decoded);
