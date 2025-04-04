function [equi] = rad2im(radian)
% rad2im - converts angle in radians to polar form.
% z = cosx + jsinx
% 
% Input:
% radian - radian
% 
% Output:
% equi - radian in Euler's Form
%
%
% For Application 2: ECE21113L - Grp 8

equi = cos(radian) + 1j*sin(radian);