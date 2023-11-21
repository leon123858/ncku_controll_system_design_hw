clc 
clear
close all

PMC = 50;
k=30;
G = zpk([],[-0.5 -1 -2 0],1);
figure(1)
margin(G);
grid;
PMU = 180 - -180;
thm=PMC - PMU + 8;
Wzp = (1-sind(thm))/(1+sind(thm));
Wgdb = 20*log10((Wzp)^(0.5));
Wzp2 =0.95^2; 
Wp = (Wzp2/Wzp)^(0.5);
Wz = Wp * Wzp;
Gc = zpk([-(Wz) 1],[-(Wp) 1],1);

Gf = series(Gc*(1/2),G);
figure(2)
margin(Gf);
grid;
figure(4)
rlocus(Gf)

Ga = feedback(Gf*10,1);
figure(3)
step(Ga)