function [C,Ceq] = Noncon(x)
    R = 120/2;
    [d,l_5,l_A2O4,R_1,l_4,l_A1A2,l_A2A3,l_A1O4,l_6,theta_4,theta_5,A_O1O4A1,theta_6] = paraII(x);
    C = [ theta_4 - pi/4
        theta_5 - pi/4
        A_O1O4A1 - pi/4];
    Ceq = [
        ];
end
    