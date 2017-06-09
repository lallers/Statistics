%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
clc;clear all;close all;hold off
d = [197.7 197.7 197.7 197.7 197.7 197.7 197.7 197.7 197.7 197.7 197.7 197.7];
V1 =[ 186 184.3 185.8 186.8 181.9 185.2 184 185.7 186 185.5 182.5 183.8];
V2 =[ 323.5 320.6 323.2 324.8 316.4 322.1 320 322.9 323.5 322.6 317.4 319.6];

V1mean = mean(V1);
v1std = std(V1);
Vwmean = mean(V2);
v2std = std(V2);
dstd = std(d);
a = (V2 - V1)./(2.*d);
astd = v1std + v2std + dstd;

E1 = sum((V1./d))^2*v1std^2;
E2 = sum((V2./d))^2.*v2std^2;
E = sqrt(E1+E2);


A = [1 5.03 3.58 2.67 2.72 2.63 3.42;
    2 7.31 7.31 9.39 9.39 8.84 7.27;
    4 12.78 11.80 11.57 11.38 10.85 12.15;
    6 13.33 14.95 15.27 12.69 16.78 15.58;
    8 16.55 17.77 16.64 16.52 17.69 19.44;
    10 20.03 21.26 20.75 20.92 21.57 20.17];

Vavg1 = mean(A(1,[2:end])); Vstd1 = std(A(1,[2:end]));
Vavg2 = mean(A(2,[2:end])); Vstd2 = std(A(2,[2:end]));
Vavg3 = mean(A(3,[2:end])); Vstd3 = std(A(3,[2:end]));
Vavg4 = mean(A(4,[2:end])); Vstd4 = std(A(4,[2:end]));
Vavg5 = mean(A(5,[2:end])); Vstd5 = std(A(5,[2:end]));
Vavg6 = mean(A(6,[2:end])); Vstd6 = std(A(6,[2:end]));
I = A(:,1);
MEAN = [Vavg1,Vavg2,Vavg3,Vavg4,Vavg5,Vavg6];
STD = [Vstd1,Vstd2,Vstd3,Vstd4,Vstd5,Vstd6];
R1 = A(:,2);
R2 = A(:,3);
R3 = A(:,4);
R4 = A(:,5);
R5 = A(:,6);
R6 = A(:,7);
figure(1)
plot(I,R1,I,R2,I,R3,I,R4,I,R5,I,R6);
xlabel('Current (I)');ylabel('Voltage (V)');
legend('R1','R2','R3','R4','R5','R6')
figure(2)
hold on
plot(I,MEAN,'b')
errorbar(I,MEAN,STD,'rx')

xlabel('Current (I)');ylabel('Voltage (Mean Voltage)');
legend('Vavg','Error')
hold off


sigV = ((1./I').*STD).^2;
sigI = ((-MEAN./(I'.^2)).*1e-3).^2;

sig1 = sqrt(sigV + sigI);

Z1=V1./d * std(V1);
Z2=V2./d * std(V2);
Z3=-(V1.^2-V2.^2)./(2*d.^2) * std(d);

Z = sqrt(sum(Z1)^2 + sum(Z2)^2 + sum(Z3)^2);





