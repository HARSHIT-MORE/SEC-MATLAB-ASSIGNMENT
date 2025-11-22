% plotting_visualization.m
% Demonstrates line plot, scatter, subplot, labels and saving figure.

clc; clear; close all;
x = linspace(0,2*pi,200);
y1 = sin(x);
y2 = cos(2*x).*exp(-0.3*x);

figure('Name','Plotting Examples','NumberTitle','off');

subplot(2,1,1)
plot(x,y1,'LineWidth',1.5)
title('y = sin(x)')
xlabel('x'), ylabel('sin(x)')
grid on

subplot(2,1,2)
scatter(x, y2, 8, y2)    % color by value
title('y = cos(2x)*e^{-0.3x}')
xlabel('x'), ylabel('y2')
colorbar
grid on

% Save as PNG
saveas(gcf, 'plot_examples.png');
fprintf('Saved figure to plot_examples.png\n');
