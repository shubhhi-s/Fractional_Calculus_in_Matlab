function output = fderiv(x, alpha, n, h)
% FDERIVE Calculate the derivative of x
%    x      Sampled function
%    alpha  Fractional order
%    n      Size of the memory
%    h      Sampling rate
%
%    Please refer to http://www3.nd.edu/~msen/Teaching/UnderRes/FracCalc1.pdf
%    See equ. 32

N = length(x);
output = zeros(1, N);

h_a = h^alpha;

for i = 1 : N
    sigma = 0;
    for m = 0 : 1 : n
    
    if i - m < 1
        break;
    end
        
        sigma = sigma + (-1)^m * gamma(alpha + 1) / (factorial(m) * ...
                gamma(alpha - m + 1)) * x(i - m);
    end
    
    output(i) = sigma / h_a;
end

end