clear
close all
tc = 0.8
damp = 0.5
damp2 = damp^2 % s = -1.25 + 2.1651j
S_first= -(1/tc)
S_after= (1/tc)*(((1-damp2)/damp2)^(1/2))
 
S=S_first + i*S_after
L = S*(2*S+1)*(S+1)*(0.5*S+1)
 
for i = 5.694:0.001:5.694 % a:b:c   a->start point b->interval c->final point
syms a w
k=i
A=solve(17-5*k+8*k*a==0,a);
S=solve(23+k*(-3)-5*k*A+k*A*A+k*w*w == 0,w);
z1=A+S(1)*(-1)^(0.5)
z2=A-S(1)*(-1)^(0.5)
 
    plant = tf([1 2*eval(A) eval(z1*z2)],conv(conv(conv([2 1],[1 1]),[0.5 1]),[1 0]))
    plant_new = feedback(plant*k,1,-1)
    
    figure(1)
    hold on
    step(plant_new)
    hold off
    figure(2)
    rlocus(plant_new)
    tf=20;
    t=0:0.01:tf;
    ramp=t;
    figure(3)
    lsim(plant_new,ramp,t); 
end


