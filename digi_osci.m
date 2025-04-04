% ECE21113L: Grp 8 - Application 3
f = [3*pi/20, pi/2, 3*pi/4];  % frequencies for the three sine waves

% z transform of system 1, cos(pi*3/20)*u(n)
num1 = [1 -cos(f(1))];
denom1 = [1 -2*cos(f(1)) 1];

% z transform of system 2, cos(pi/2)*u(n)
num2 = [1 -cos(f(2))];
denom2 = [1 -2*cos(f(2)) 1];

% z transform of system 3, cos(pi*3/4)*u(n)
num3 = [1 -cos(f(3))];
denom3 = [1 -2*cos(f(3)) 1];

% Compute the impulse response for each oscillator, with the first 100 samples
% (parallel components)
[h1, n1] = impz(num1, denom1, 100);
[h2, n2] = impz(num2, denom2, 100);
[h3, n3] = impz(num3, denom3, 100);

% Combine the impulse responses for the overall response
[h_12,n_12] = sigadd(h1,n1,h2,n2);
[h_total,n_total] = sigadd(h_12,n_12,h3,n3);

% comparison of plots of the impulse response vs the original signal x(n)
figure;
subplot(2,1,1);
plot(n_total,h_total)
title('The Impulse Response of h(n)')
xlabel('Index')
ylabel('Impulse Response')
grid on

% the input signal
n = n_total;
x_n = (cos((f(1))*n')+cos((pi/2)*n')+cos((pi*3/4)*n')).*ustep(length(n)); 
subplot(2,1,2);
plot(n,x_n)
title('The Original Signal x(n)')
xlabel('Time (s)')
ylabel('Amplitude')
grid on