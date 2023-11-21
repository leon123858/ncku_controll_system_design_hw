clc;clear;close all;
 
Gp=zpk([],[-0.5 -1 -2],27);
wp=17;
wz=0.6;
wz2 = 0.7;
wp2 = 0;
Gc=zpk([-wz],[-wp],1);
Gc2=zpk([-wz2],[-wp2],1);
G1=series(Gc2,Gc);
G = series(Gp,G1);

figure(1)
rlocus(G*(1/27))


figure(2)
margin(G)
grid
 
sys=feedback(G,1);
figure(3)
margin(sys)
grid
figure(4)
step(sys)
