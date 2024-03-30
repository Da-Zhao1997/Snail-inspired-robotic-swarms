function [g,h]=fun2(x)
    R = 150/2;
    [pp,l_b2b3,l_3,l_5,R2,l_1,theta_1,L_2,L_1,R1,n_int,np_int,theta_45,theta_Tem3,theta_rot] = para(x);
    g=[theta_45 - pi*42/180
    n_int + 2
    np_int + 2
    4*R^2+l_1^2-4*R*l_1*cos(theta_1)-(R+x(1))^2
    0.8 * R - L_1
    R - L_2
    2 * x(1) + 5 - l_5
    ]; % nonlinear constraints

    h=[]; 
end