clc
clear all
close all

syms s z
format long g

% Parámetros del sistema de suspensión
m1 = 50;    % Masa no suspendida (kg) - llanta
m2 = 300;   % Masa suspendida (kg) - chasis
b = 1000;   % Coeficiente de amortiguamiento (Ns/m)
k1 = 20000; % Constante del resorte principal (N/m)
k2 = 15000; % Constante del resorte secundario (N/m)


cuarta=m1*m2;
tercera=(m1+m2)*b;
segunda=[k1*m2+(m1+m2)*k2];
primera=k1*b;
cte=k1*k2;

num=k1*(b);
num2=k1*k2;

A=[0 1 0 0; 0 0 1 0; 0 0 0 1; -300/0.015 -20/0.015 -11.25/0.015 -0.35/0.015];
B=[0; 0; 0; 1];
C=[300 20 0 0];
D=[0];

AB=A*B;

AA=A*A;
AAB=AA*B;

AAA=AA*A;
AAAB=AAA*B;

phi=[B AB AAB AAAB];
inversa=inv(phi);
transpuesta=transpose(inversa);

ejem=det(s*eye(4)-A);

newRoots=[-15 -17 -5 -10];
poly(newRoots);

phiA=(AAA*A)+(47*AAA)+(785*AA)+(5425*A)+(12750*eye(4));

k=[0 0 0 1]*inversa*phiA;


Ao=[0 0 0 -300/0.015; 1 0 0 -20/0.015; 0 1 0 -750; 0 0 1 -0.35/0.015];
Bo=[300/0.015; 20/0.015; 0; 0];
Co=[0 0 0 1];
Do=[0];

observ=[Co; Co*Ao; Co*Ao^2; Co*Ao^3];
%phio=Ao^4+94*Ao^3+3140*Ao^2+43400*Ao+204000*eye(4);
phio=Ao^4+188*Ao^3+12560*Ao^2+347200*Ao+3264000*eye(4);
inversao=inv(observ);
ko=phio*inversao*[0;0;0;1];


%Observador desde la forma canonica controlable
observC=[C; C*A; C*A^2; C*A^3];
phioC=A^4+188*A^3+12560*A^2+347200*A+3264000*eye(4);
inversaoC=inv(observC);
koC=phioC*inversaoC*[0;0;0;1]
