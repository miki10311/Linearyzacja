clear all;
close all;

fwemax=5;

mfwe1=[0.2, 0.5, 0.9];
mfwe2=[0,0,0];
fwe2=1;

dfwe1=0.1*fwemax;
dfwe2=0;

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


figure(1);
hold on;
grid on;
for i= 1:3
fwe1=mfwe1(i)*fwemax;
h20=(fwe1+fwe2)/(a2);
h10=(fwe1/a1)+h20;
sim('schemat_8',30);
plot(ans.tout, ans.h1, 'r')
plot(ans.tout, ans.h2, 'g')
end
title('Model zlinearyzowany z transmitancji')
xlabel('t[s]')
ylabel('h[m]')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %zlinearyzowany
% figure(2);
% hold on;
% grid on;
% for i= 1:3
% fwe1=mfwe1(i)*fwemax;
% h20=(fwe1+fwe2)/(a2);
% h10=(fwe1/a1)+h20;
% sim('schemat_lab6b',30);
% plot(ans.tout, ans.h1b, 'r')
% plot(ans.tout, ans.h2b, 'g')
% end
% title('Model zlinearyzowany bez transmitancji')
% xlabel('t[s]')
% ylabel('h[m]')




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%razem

figure(3);
hold on;
grid on;
for i= 1:3
fwe1=mfwe1(i)*fwemax;
h20=(fwe1+fwe2)/(a2);
h10=(fwe1/a1)+h20;
sim('schemat_8',30);
plot(ans.tout, ans.h1, 'b')
plot(ans.tout, ans.h2, 'g')



% fwe1=mfwe1(i)*fwemax;
% h20=(fwe1+fwe2)/(a2);
% h10=(fwe1/a1)+h20;
% sim('schemat_lab6b',30);
% plot(ans.tout, ans.h1b, 'r--')
% plot(ans.tout, ans.h2b, 'k--')
end
title('Wykresy z obu schematów')
xlabel('t[s]')
ylabel('h[m]')

