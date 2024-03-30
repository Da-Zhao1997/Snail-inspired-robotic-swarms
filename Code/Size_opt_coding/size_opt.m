%% Seven basic sizes
clear;clc;
R = 150/2; % radius of the sphere
r = 35/2; % radius of the wheel
theta_2 = 44 * pi /180; % rad
theta_3 = 52.41 * pi /180;
l_2 = 38.71; % mm
l_4 = 53.27; 
l_6 = 70;
%% 
l_3 = sqrt(l_2^2 + l_6^2 -2 * l_2 * l_6 * cos(theta_2));
l_5 = sqrt(l_3^2 + l_4^2 - 2 * l_3 * l_4 * cos(theta_3));
R2 = 2 * R -l_6 - r;
cosTs = (l_6^2 + l_3^2 - l_2^2)/(2 * l_6 * l_3) * (l_5^2 + l_3^2 - l_4^2)/(2 * l_5 * l_3) - ...
    (l_2 * l_4 * sin(theta_2) * sin(theta_3))/(l_3 * l_5);
l_1 = sqrt(l_5^2 + l_6^2 -2 * l_5 * l_6 * cosTs);
theta_1 = acos((l_1^2 + l_6^2 -l_5^2)/(2 * l_1 * l_6));
L_2 = 2 * sqrt(R^2 - R2^2);
R1 = sqrt(l_5^2 + (2 * R - l_6)^2 - 2 * l_5 *(2 * R - l_6) * (-cosTs)) - r;
L_1 = 2 * sqrt(R^2 - R1^2);
%% On flat ground
l_Tem = sqrt(l_1^2 + l_2^2 -2 * l_1 * l_2 * cos(theta_1 + theta_2));
theta_Tem = pi - acos((l_3^2 + l_5^2 - l_4^2)/(2 * l_3 *l_5));
cosTTem2 = (l_1^2 + l_Tem^2 - l_2^2)/(2 * l_1 * l_Tem) * sqrt(1-(l_3 * sin(theta_Tem)/l_Tem)^2) - ...
    l_2 * sin(theta_1 + theta_2) * l_3 * sin(theta_Tem) / l_Tem^2;
theta_Tem2 = acos(cosTTem2);
H = l_1 * sin(theta_Tem2) + r;
theta_Tem3 = 2 * pi - theta_1 - theta_2 - theta_Tem - theta_Tem2;
%% connected
dis_self = R/30;
theta_rot = 2 * pi - theta_Tem3 - theta_3 - acos((l_2^2 + l_4^2 -(R1 + r + dis_self)^2)/(2 * l_2 * l_4));
m = sqrt(l_2^2 + l_4^2 - 2 * l_2 * l_4 * cos(theta_Tem3 + theta_3 + theta_rot));
%sinTTem4 = (l_2 * cos(theta_2) + l_4 * sin(3 * pi/2 - theta_2 - theta_3 - theta_Tem3 - theta_rot)) / m; 
sinTTem4 = (l_2 * cos(theta_2) + l_4 * sin(2 * pi - theta_1 - theta_2 - theta_3 - theta_Tem3 - theta_Tem2 - theta_rot)) / m;
n = sqrt(m^2 + 4 * R^2 - 4 * R * m * sqrt(1 - (sinTTem4)^2));

%% sliding scene III
coso1a1b3 = (l_2^2+l_Tem^2-l_1^2)/(2*l_2*l_Tem);
cosb3a1b2 = cos(theta_Tem3+theta_rot) * coso1a1b3 + sin(theta_Tem3+theta_rot) * sqrt(1-coso1a1b3^2);
l_b2b3 = sqrt(l_Tem^2+l_3^2-2*l_Tem*l_3*cosb3a1b2);
cosb2b3o2 = (l_b2b3^2+(R1+r)^2-(R2+r)^2)/(2*l_b2b3*(R1+r));
coso1b3a1 = (l_1^2 + l_Tem^2 - l_2^2)/(2*l_1*l_Tem);
cosb2b3a1 = (l_Tem^2 + l_b2b3^2 - l_3^2)/(2*l_Tem*l_b2b3);
coso1b3b2 = coso1b3a1 * cosb2b3a1 - sqrt(1-coso1b3a1^2) * sqrt(1-cosb2b3a1^2);

coso1b3o2 = coso1b3b2 * cosb2b3o2 - sqrt(1-coso1b3b2^2) * sqrt(1-cosb2b3o2^2);
l_o1o2 = sqrt(l_1^2 + (R1+r)^2 - 2*l_1*(R1+r)*coso1b3o2);

coso2o1o3 = (l_o1o2^2 + 4 * R^2 - 8 * R^2)/(2*l_o1o2*2*R);
cosa1o1b1 = (m^2 + l_2^2 - l_4^2)/(2*l_2*m);
cosb3o1o2 = (l_1^2 + l_o1o2^2 - (R1+r)^2)/(2*l_1*l_o1o2);
coso2o1a1 = cos(theta_1+theta_2) * cosb3o1o2 + sin(theta_1+theta_2)*sqrt(1-cosb3o1o2^2);
if (theta_Tem3 + theta_rot + theta_3) >= pi
    coso2o1b1 = coso2o1a1 * cosa1o1b1 - sqrt(1-coso2o1a1^2)*sqrt(1-cosa1o1b1^2);
    coso3o1b1 = coso2o1o3 * coso2o1b1 + sqrt(1 - coso2o1o3^2) * sqrt(1 - coso2o1b1^2);
else
    coso2o1b1 = coso2o1a1 * cosa1o1b1 + sqrt(1-coso2o1a1^2)*sqrt(1-cosa1o1b1^2);
    coso3o1b1 = coso2o1o3 * coso2o1b1 + sqrt(1 - coso2o1o3^2) * sqrt(1 - coso2o1b1^2);
end

n_p = sqrt(m^2 + 4*R^2 - 4 * R * m * coso3o1b1)

%% 
cosb3o2o1 = ((R1+r)^2+(R2+r)^2-l_5^2)/(2*(R1+r)*(R2+r));
cosb3o2b2 = ((R1+r)^2+(R2+r)^2-l_b2b3^2)/(2*(R1+r)*(R2+r));

forw = acos(cosb3o2b2)-acos(cosb3o2o1);
pp = (forw*R2)/(r*(theta_Tem3-theta_rot))




