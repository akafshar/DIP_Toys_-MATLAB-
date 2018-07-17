% (Shifted) Softplus function -- "Centered" at (0,0)
% Meant to be used as an activation function in NNs

% Written by Amir K. Afshar

function f = softplus(x)

f = 1 + exp(x);
f = log(f)- log(2);

% f(x) = log(1 + exp(x)) - log(2)
% or equivalently,  
% f(x) = log(0.5*(1 + exp(x)))

% Thus, f'(x) = 1/(1 + exp(-x)), the logistic (sigmoid) function!

% This function has some important positives, namely:
% 1. Continuity!
% 2. A simple, well-known, and useful derivative
% 3. Reduced risk of dead neurons compared to ReLu

end

