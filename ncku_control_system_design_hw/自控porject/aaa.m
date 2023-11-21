% clc;clear;close all;
% % (Q1)
% G=zpk([],[-0.5 -1 -2],1);
% figure(1);rlocus(G);
% figure(2);rlocus([1],[1 3.5 3.5 1])
% % (Q2) 
% k1=0.1;k2=11;k3=20;
% Gp1=zpk([],[-0.5 -1 -2],k1);
% Gp2=zpk([],[-0.5 -1 -2],k2);
% Gp3=zpk([],[-0.5 -1 -2],k3);
% 
% sys1=feedback(Gp1,1);
% sys2=feedback(Gp2,1);
% sys3=feedback(Gp3,1);
% 
% 
% pole_sys1=pole(sys1)
% pole_sys2=pole(sys2)
% pole_sys3=pole(sys3)
% 
% figure(2);step(sys1,20);
% figure(3);step(sys2,20);
% figure(4);step(sys3,20);

% Q3
%phase lead

d=0.5; %dampig ratio
ts=4; %settling time
tc=ts/5; %time constant
s1=-(1/tc)+(1/tc)*(((1-d^2)/(d^2))^(0.5))*1j;
s2=-(1/tc)-(1/tc)*(((1-d^2)/(d^2))^(0.5))*1j; %dominant poles

syms k z p 
z=0.7;
f=1+k*((s1+z)/(s1+p))*(1/((2*s1+1)*(s1+1)*(0.5*s1+1)));
Re=real(f);
Im=imag(f);
[sol_k, sol_p] = vpasolve([Re== 0, Im ==0], [k,p]);
sol_z=z;    
k1=double(sol_k);
z1=double(sol_z);
p1=double(sol_p);

    Gc1=zpk([-z1],[-p1],k1);
    Gc2=zpk([-0.6],[],1);
    Gc3=zpk([],[0],1);
    Gc4=series(Gc2,Gc3);
    Gc=series(Gc1,Gc4);
    
    Gp=zpk([],[-0.5 -1 -2],1);
    G=series(Gp,Gc);
    sys_phaselead=feedback(G,1);
    pole_phaselead=pole(sys_phaselead);
    zero_phaselead=zero(sys_phaselead);
    figure(1)
    rlocus(G);
    axis([-5 5 -10 10])
    figure(2) 
    step(sys_phaselead,20);axis([0 10 -1 1.5])
    tf=20;
    t=0:0.01:tf;
    ramp=t;
    figure(3)
    lsim(sys_phaselead,ramp,t);
    
    


   

