% ECE21113L - Application 2
% b and a are generated from:
% >> % [b,a] = pole_zero(0.5*rad2im([0, pi/4, pi/2, 3*pi/4, pi, -pi/4, -pi/2, -3*pi/4]),
% [0.8*rad2im([pi/4, -pi/4, pi*3/4, -pi*3/4]) 1.2*rad2im([pi/4, -pi/4, pi*3/4, -pi*3/4])],1)

n = 0:511; % 512 points
x_n = (cos((pi*3/20)*n)+cos((pi/2)*n)+cos((pi*3/4)*n)).*ustep(length(n)); % the input signal

% the plotted signal in the time domain
figure;
subplot(2,1,1);
plot(n,x_n)
title('The Input Signal in the Time Domain')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

% Frequency domain
S_input = fft(x_n, 512);
w = linspace(0, pi, 512); % the frequency vector
subplot(2,1,2);
plot(w/pi,20*log10(S_input))
title('The Input Signal in the Frequency Domain')
xlabel('Normalized Frequency (\times \pi /rad)')
ylabel('Magnitude (dB)')
grid on


filtered_signal = filter(b,a,x_n); % the filtered signal using the coefficients of the designed filter

figure;
subplot(2,1,1);
plot(n,filtered_signal);
title('The Filtered Input Signal in the Time Domain')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

S_filter = fft(filtered_signal, 512);
subplot(2,1,2);
plot(w/pi,20*log10(S_filter))
title('The Filtered Input Signal in the Frequency Domain')
xlabel('Normalized Frequency (\times \pi /rad)')
ylabel('Magnitude (dB)')
grid on