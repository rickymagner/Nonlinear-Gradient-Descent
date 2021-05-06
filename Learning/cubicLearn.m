% Main learning algorithm for cubic regression

X = csvread('../Data/noisy_cubic_data.csv');
X = X(2:end,:);  % to get rid of column labels
X = X(:,2:end);  % to get rid of index column
y = X(:,end);

% Prepare dataset for cubic reg
X = [ones(size(X)(1),1) X(:,1) X(:,1).^2 X(:,1).^3];


% Learning parameters
num_iters = 100;
alpha = .1;
lambda = 1;
J_list = 0;
Theta = rand(size(X)(2),1);

% Gradient descent
for i = 1:num_iters
    [J, grad] = linRegCost(X, y, Theta, lambda);
    Theta = Theta - alpha * grad;
    J_list = [J_list J];
end


% Plot results
t = linspace(-2, 2, 100);
pred = Theta(1) + Theta(2)*t + Theta(3)*t.^2 + Theta(4)*t.^3;
plot(t, pred)
hold on;
scatter(X(:,2), y)
%plot(J_list)
