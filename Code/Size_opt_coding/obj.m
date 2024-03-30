function f = obj(x)
    R = 120/2;
    [d,l_5,l_A2O4,R_1,l_4,l_A1A2,l_A2A3,l_A1O4,l_6,theta_4,theta_5,A_O1O4A1,theta_6] = paraII(x);
    w_1 = 50;
    w_2 = 50;
    w_3 = 10;
    w_4 = 1;
%     f = w_1 * (-l_4)+ w_2* (- l_A2A3) + w_3 * theta_6 + w_4 * (x(6)*sin(x(2)+x(3))+x(1));
    f = w_1 * (-l_4)+ w_2* (- l_A2A3);
end