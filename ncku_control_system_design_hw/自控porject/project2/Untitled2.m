clc;clear;close all;
 
Gp=zpk([],[-0.5 -1 -2],27);
wp=0.0206;
wz=0.6;
Gc=zpk([-wz],[-wp],wp/wz);
 
G=series(Gp,Gc);
 
figure(1)
margin(Gp)
grid

figure(4)
rlocus(Gp)

figure(2)
margin(G)
grid
 
sys=feedback(G,1);
figure(3)
step(sys)
