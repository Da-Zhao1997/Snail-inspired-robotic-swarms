function [d,l_5,l_A2O4,R_1,l_4,l_A1A2,l_A2A3,l_A1O4,l_6,theta_4,theta_5,A_O1O4A1,theta_6] = paraII(x)
%% Seven basic parameters
R = 120/2;
r_1 = x(1);
theta_2 = x(2);
theta_3 = x(3);
l_1 = x(4);
l_2 = x(5);
l_3 = x(6);
%%
d = 10;
l_5 = 3.2;
l_A2O4 = sqrt(l_2^2 + l_1^2 - 2*l_1*l_2*cos(theta_3));
R_1 = l_A2O4 - r_1;
l_4 = 2*sqrt(R^2-R_1^2) - d;
l_A1A2 = sqrt(l_3^2+l_2^2-2*l_3*l_2*cos(theta_2));
l_A2A3 = sqrt(l_2^2+l_2^2-2*l_2*l_2*cos(2*theta_3));
l_A1O4 = sqrt(l_3^2+l_1^2-2*l_3*l_1*cos(theta_2+theta_3));
theta_5 = asin((l_4+d)/sqrt((l_4+d)^2+4*(l_1-l_2*cos(theta_3)-r_1)^2));
l_6 = r_1 - 2*(d*tan(theta_5)+l_5/cos(theta_5));
%% coverage range
theta_4 = asin(r_1/(R_1+r_1))+asin(l_2*sin(theta_3)/(R_1+r_1));
% theta_5 = asin((l_4+d)/sqrt((l_4+d)^2+4*(l_1-l_2*cos(theta_3)-r_1)^2));
A_O1O4A1 = asin(r_1/l_A1O4)+asin(l_3*cos(theta_2+theta_3)/l_A1O4);
%% theta_6
l_O2O4 = sqrt(l_1^2+4*R^2);
l_A1O2 = R_1 + r_1;
A_O2A1O4 = acos((l_A1O2^2+l_A1O4^2-l_O2O4^2)/(2 * l_A1O2 * l_A1O4));
A_O1A1O4 = pi - theta_2 - theta_3 - A_O1O4A1;
A_O2A1O1 = 2 * pi - A_O2A1O4 - A_O1A1O4;
l_O1O2 = sqrt(l_A1O2^2 + l_3^2 - 2 * l_A1O2 * l_3 * cos(A_O2A1O1));
A_O2O1A1 = asin(l_A1O2 / l_O1O2 * sin(A_O2A1O1));
A_PO1O2 = acos(l_O1O2/(2*R));
theta_6 = theta_2 + theta_3 + A_O2O1A1 + A_PO1O2;

end






