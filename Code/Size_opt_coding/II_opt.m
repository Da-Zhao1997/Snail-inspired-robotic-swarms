clear;clc;
R = 120/2;
%  r_1 ,  theta_2, theta_3, l_1,    l_2,    l_3
% x(1),   x(2),   x(3),   x(4),   x(5),   x(6)   
x0 = [40/2, 40 * pi /180, 38 * pi /180, 100, 54.5, 51];% Ax <= b
A = [];
b = [];
% Aeqx = beq
Aeq = [];
beq = [];
% lb <= x <= ub
lb = [20, 30 * pi /180, 5 * pi /180, 100 /60 * R, 20 /60  * R, 45 /60*R];
up = [70, 50 * pi /180, 80 * pi /180, 120 /60 * R, 90 /60  * R, 90 /60 * R];

[x,y] = fmincon('obj',x0,A,b,Aeq,beq,lb,up,'Noncon');
x(2) = x(2) * 180 / pi;
x(3) = x(3) * 180 / pi;
x