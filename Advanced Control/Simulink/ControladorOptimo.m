close all
clear all
clc

% Matrices del sistema
A=[0 1 0 0; 0 0 1 0; 0 0 0 1; -300/0.015 -20/0.015 -11.25/0.015 -0.35/0.015];
B=[0; 0; 0; 1];
C=[300 20 0 0];
D=[0];

Q = eye(4);    % Ponderación en los estados
R = 1;             % Ponderación en el control

[K,S,P]=lqr(A,B,Q,R)


