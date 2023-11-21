clear
close all
s = -1.25+2.1651i;
%syms k;
%y = solve((1/(2*s + 1)*(s+1)*(0.5*s+1)*s)*k*(s+z1)*(s+z2) + 1)
tc = 0.8
damp = 0.5
damp2 = damp^2 % s = -1.25 + 2.1651j
S_first= -(1/tc)
S_after= (1/tc)*(((1-damp2)/damp2)^(1/2))

S=S_first + i*S_after
L = S*(2*S+1)*(S+1)*(0.5*S+1)


A=solve(22.9687+k*(-3.125)-5*k*a+k*a*a+k*w*w == 0,17.05-5.4127*k+8.6602*k*a==0,a,w);

    plant = tf(conv([1 A.a(1)],[1 A.w(1)*i]),conv(conv(conv([2 1],[1 1]),[0.5 1]),[1 0]))
    plant_new = feedback(plant*k,1,-1)
    figure(i)
    step(plant_new)

