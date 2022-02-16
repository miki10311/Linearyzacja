clear all;
close all;

fwemax=5;

mfwe1=0;
mfwe2=0.5;
fwe1=1;

dfwe1=0;
dfwe2=0.1*fwemax;

a1=10;
a2=5;

A1=10;
A2=10;

M1=A1*A2;
M2=A1*a1+A1*a2+a1*A2;
M3=a1*a2;

G11a=A2;
G11b=a1+a2;
G12=a1;
G21=a1;
G22a=A1;
G22b=a1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%bloczek state-escape
A=[(-a1/A1), (a1/A1); (a1/A2), ((-a1-a2)/A2)];
B=[ (1/A1) ,    0   ;  0,        (1/A2)     ];
C=[1,0;0,1];
D=zeros(2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%razem

figure(1);
hold on;
grid on;
for i= 1:3
fwe2=mfwe2*fwemax;
h20=(fwe1+fwe2)/(a2);
h10=(fwe1/a1)+h20;
sim('schemat_8',30);
plot(ans.tout, ans.h1, 'b.')



fwe2=mfwe2*fwemax;
h20=(fwe1+fwe2)/(a2);
h10=(fwe1/a1)+h20;
sim('schemat_lab6b',30);
plot(ans.tout, ans.h1b, 'k-')


fwe2=mfwe2*fwemax;
u=[fwe1;fwe2];
h=-(A^(-1))*B*u;
sim('schemat_lab7',30);
plot(ans.tout, ans.h1, 'r--')
end
title('Wykresy dla h1')
xlabel('t[s]')
ylabel('h[m]')
legend('Z równań','Z bloczkiem state-space','Z transmitancji')

figure(2);
hold on;
grid on;

fwe2=mfwe2*fwemax;
h20=(fwe1+fwe2)/(a2);
h10=(fwe1/a1)+h20;
sim('schemat_8',30);
plot(ans.tout, ans.h2, 'b.')



fwe2=mfwe2*fwemax;
h20=(fwe1+fwe2)/(a2);
h10=(fwe1/a1)+h20;
sim('schemat_lab6b',30);
plot(ans.tout, ans.h2b, 'k-')


fwe2=mfwe2*fwemax;
u=[fwe1;fwe2];
h=-(A^(-1))*B*u;
sim('schemat_lab7',30);
plot(ans.tout, ans.h2, 'r--')

title('Wykresy dla h2')
xlabel('t[s]')
ylabel('h[m]')
legend('Z równań','Z bloczkiem state-space','Z transmitancji')
