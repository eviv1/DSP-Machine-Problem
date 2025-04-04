function [b,a] = pole_zero(p,z)
% pole_zero - plots pole zero plot and both magnitude and frequency
% response. has a gain to increase the gain of the system.
% 
% Inputs:
% p - poles
% z - zeroes
% gain - gain
% 
% Outputs:
% b - numerator
% a - denominator
% Pole-Zero Plot
% Frequency Response
%
% For Application 2: ECE21113L - Grp 8

b = poly(z); % numerator
a = poly(p); % denominator

figure;
zplane(b,a);
figure;
freqz(b,a);