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
subplot(1,2,1);
plot(t, pred, 'r')
hold on;
color = [31/256, 119/256, 180/256];
color_mat = reshape(repmat(color, 1, length(X(:,2))), 3, length(X(:,2)))';
sz = ones(length(X(:,2)),1)*25;
scatter(X(:,2), y, sz, color_mat, "filled")

name = title("Cubic regression curve");
leg = legend(strcat("Curve: y =  " , num2str(Theta(4)) , "x^3 " , num2str(Theta(3)) , "x^2 " , num2str(Theta(2)) , "x + " , num2str(Theta(1))));
set(name, "fontsize", 20);
set(leg, "fontsize", 16);

subplot(1,2,2);
plot(J_list(:,2:end));
name = title("Cost function after x iterations");
set(name, "fontsize", 20);
