function [y,n] = sigadd(x1,n1,x2,n2)
% sigadd - Gives an output by adding two input signals x1 (with index n1)
% and x2 (with index n2). With zero padding.
% y(n) = x1(n) + x2(n)
%
% Input: 
% x1 = first signal
% n1 = first index
% x2 = 2nd signal
% n2 = 2nd index
% 
% Output:
% y = output signal
% n = index
 arguments
            x1, n1, x2, n2 (1,:) {mustBeNumeric} %The input arguments must be a number and should be a 1xn dimension.
    end

n = min(min(n1),min(n2)):max(max(n1),max(n2)); % The index, takes the min and max index from the two signals

y1 = zeros(1,length(n)); % For a blank matrix
y2 = zeros(1,length(n));
y1((n>=min(n1)) & (n<=max(n1))==1) = x1; % Matching the indices with the array position
y2((n>=min(n2)) & (n<=max(n2))==1) = x2;

y = y1 + y2;
stem(n,y) % Plots the graph

title('Sum of Signals x1(n) and x2(n)');
xlabel('Index')
ylabel('Output Signal')
grid on

end