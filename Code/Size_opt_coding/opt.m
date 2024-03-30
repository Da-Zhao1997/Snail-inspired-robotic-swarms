clear;clc;
%  r ,  theta_2, theta_3, l_2,    l_4,    l_6
% x(1),   x(2),   x(3),   x(4),   x(5),   x(6)   
R = 150/2;
x0 = [35/2*R/75, 44 * pi /180, 52.41 * pi /180, 38.71*R/75, 53.27*R/75, 70*R/75];
% Ax <= b
A = [];
b = [];
% Aeqx = beq
Aeq = [];
beq = [];
% lb <= x <= ub
lb = [0.1 * R, 38 * pi /180, 45 * pi /180, 30/75 * R, 48/75  * R, 60/75*R];
up = [10/30 * R, 55 * pi /180, 60 * pi /180, 45/75 * R,   60/75  * R,   90/75 * R];
[x,y] = fmincon('fun1',x0,A,b,Aeq,beq,lb,up,'fun2');
x(2) = x(2) * 180 / pi;
x(3) = x(3) * 180 / pi;
x



