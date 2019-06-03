clear all;
close all;
clc;

Irect=@(d,m) [m*(d(2)^2+d(3)^2)/12 0 0;
                          0 m*(d(1)^2+d(3)^2)/12 0;                           
                            0 0 m*(d(1)^2+d(2)^2)/12];

Ipat=@(rho,I,m) I-m*crocce(rho)*crocce(rho);

bus.m=500;              %kg
bus.d=[2;2;2];          %m
bus.r=[0;0;.1953];
sp.m=20;                %kg
sp.d=[2;3;.05];         %m
sp1r=[0;2.5;.1953];         %m
sp2r=[0;-2.5;.1953];        %m
sens.m=100;             %kg
sens.d=[.25;.25;1];     %m
sens.r=[0;0;1.0547];      %m

Ibus=Irect(bus.d,bus.m);
Isp=Irect(sp.d,sp.m);
Isens=Irect(sens.d,sens.m);
Ibus_com=Ipat(bus.r,Ibus,bus.m);
Isp1_com=Ipat(sp1r,Isp,sp.m);
Isp2_com=Ipat(sp2r,Isp,sp.m);
Isens_com=Ipat(sens.r,Isens,sens.m);
Itot=Ibus_com+Isp1_com+Isp2_com+Isens_com;






