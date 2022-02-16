clear all;
close all;

fwemax=1.5;

pfwe1=[0.2, 0.5, 0.9];
pfwe2=[0,0,0];

dfwe1=0.4;
dfwe2=0;

A1=10;
A2=10;

Aw1=0.4;
Aw2=0.3;

g=9.81;
fwe2=0;

hold on;
grid on;
figure(1);
for i= 1:3
fwe1=pfwe1(i)*fwemax;
h20=((fwe1+fwe2)*(fwe1+fwe2))/(Aw2*Aw2*2*g);
h10=((fwe1*fwe1)/(Aw1*Aw1*2*g))+h20;
sim('schemat_lab6',150)
plot(ans.tout, ans.h1, 'r')
plot(ans.tout, ans.h2, 'b')
end
title('Model niezlinearyzowany')
xlabel('t[s]')
ylabel('h[m]')









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%zlinearyzowany
fwemax=5;

mfwe1=[0.2, 0.5, 0.9];
mfwe2=[0,0,0];
fwe2=1;

dfwe1=0.1*fwemax*0;
dfwe2=0;

a1=10;
a2=5;



figure(2);
hold on;
grid on;
for i= 1:3
fwe1=mfwe1(i)*fwemax;
h20=(fwe1+fwe2)/(a2);
h10=(fwe1/a1)+h20;
sim('schemat_lab6b',40);
plot(ans.tout, ans.h1b, 'r')
plot(ans.tout, ans.h2b, 'g')
end
title('Model zlinearyzowany bez bloczka state-space')
xlabel('t[s]')
ylabel('h[m]')







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%macierzowo
A=[(-a1/A1), (a1/A1); (a1/A2), ((-a1-a2)/A2)];
B=[ (1/A1) ,    0   ;  0,        (1/A2)     ];
C=[1,0;0,1];
D=zeros(2);

figure(3);
hold on;
grid on;
for i= 1:3
fwe1=0;%mfwe1(i)*fwemax;
u=[fwe1;fwe2];
h=-(A^(-1))*B*u;
sim('schemat_lab7',40);
plot(ans.tout, ans.h1, 'r')
plot(ans.tout, ans.h2, 'g')
end
title('Model zlinearyzowany z bloczkiem state-space')
xlabel('t[s]')
ylabel('h[m]')







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%razem
figure(4);
hold on;
grid on;
for i= 1:3
fwe1=mfwe1(i)*fwemax;
h20=(fwe1+fwe2)/(a2);
h10=(fwe1/a1)+h20;
sim('schemat_lab6b',40);
plot(ans.tout, ans.h1b, 'b')
plot(ans.tout, ans.h2b, 'g')
    

fwe1=mfwe1(i)*fwemax;
u=[fwe1;fwe2];
h=-(A^(-1))*B*u;
sim('schemat_lab7',40);
plot(ans.tout, ans.h1, 'r--')
plot(ans.tout, ans.h2, 'k--')
end
title('Oba modele zlinearyzowane na jednym wykresie')
xlabel('t[s]')
ylabel('h[m]')













