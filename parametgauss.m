%Gaussian Function
clear

A=10;
c=5;
sv= -15:0.1:20;
j=2;
Gf= A*exp(-(sv-j).^2/(2*c^2));  

plot(sv,Gf)