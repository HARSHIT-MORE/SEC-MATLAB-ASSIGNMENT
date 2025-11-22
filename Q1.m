% matrix_array_ops.m
% Matrix creation, indexing, solving linear systems, eigenvalues.

clc; clear; close all;
A = [4 1 2; 0 3 -1; 1 0 2];
b = [7; 4; 3];

% Display
disp('Matrix A:'); disp(A);
disp('Vector b:'); disp(b);

% Matrix operations
detA = det(A);
invA = inv(A);            % small matrix ok
x = A\b;                  % solve Ax = b (preferred)
eigVals = eig(A);

fprintf('det(A)=%g\n', detA);
disp('Inverse of A:'); disp(invA);
disp('Solution x = A\\b:'); disp(x);
disp('Eigenvalues:'); disp(eigVals);

% Reshape and concatenate
M = reshape(1:12, 3, 4); % 3x4 matrix
M_t = M';                % transpose
C = [M, ones(3,1)];      % horizontal concat

disp('Example reshape M:'); disp(M);
disp("Transpose:");disp(M_t)
disp("Horizontal Concat:");disp(C)
