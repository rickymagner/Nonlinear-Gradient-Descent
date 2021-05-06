% Linear regression cost/grad

function [J, grad] = linRegCost(X, y, Theta, lambda)

m = size(X)(1);
J = 0;
grad = zeros(size(Theta)(1),1);


% Cost function
h = X * Theta; 
J = (1/m) * sum( (h-y).^2 ) + (lambda/m) * sum( Theta.^2 );

% Gradient
grad = (1/m) * X' * (h-y);
grad(2:end,:) = grad(2:end,:) + (lambda/m) * Theta(2:end,:);
