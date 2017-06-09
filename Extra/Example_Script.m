%/////////////////////////////////////////////////////////
% By: Lee Allers                                         /
%For: Numerical Computation, 2016                        /
%     University of New Mexico                           /
%NOTE: None of my scripts are built to be robust, they   /
%      are merely an implementation of a given set of    /
%      data or instructions!                             /
%/////////////////////////////////////////////////////////
%///////////////// Question 2 /////////////////
clear all; clc; close all;
y = [5.57 6.30 5.11 4.88;
    6.28 8.59 5.89 10.85;
    13.50 12.73 12.87 8.48;
    11.70 13.35 11.65 14.56;
    19.79 18.34 13.88 16.31;
    19.41 20.85 17.00 19.43;
    24.61 24.95 22.30 24.57;
    24.99 27.67 27.59 27.52;
    27.49 33.79 26.62 34.16;
    36.36 31.71 32.13 32.40;
    38.42 39.17 32.20 36.81;
    43.26 39.47 39.66 40.00;
    43.38 42.70 44.02 43.29];

x = [0 2 3 6 8 10 12 14 16 18 20 22 24];

[lx, ly] = size(y);                      %Determines the iterations in the for loop

for i = 1:lx
 mu_y(i) = sum(y(i,:))/ly;               %finds the mean value of each row of y values
end
mu_x = sum(x)/lx;                        %finds the mean value of x

for i = 1:lx
    var = 0;
    for j = 1:ly
    var = (y(i,j) - mu_y(i))^2 + var ;   %Iterates through y to find the value (y - y_bar)^2
    end
    sigma(i) = sqrt(1/(ly)*var);         %Uses previous 'var' to determine the final value for standard devation
end

s = (x - mu_x);                          %Just to make things easier in the next calculations

for i = 1:ly
m(i) = sum(s * (y(:,i) - mu_y(i)))/sum(s.^2); %Finds the slop of each run of data
end

for i = 1:ly
mu_y = sum(y(:,i))/length(y(:,i));
mu_x = sum(x)/length(x);
b(i) = mu_y - m(i).*mu_x;                 %Finds the b value of each run of data
end

f = @(x,i) m(i).*x + b(i);                %Just to make the polynomial easier

p1 = f(x,1);                              %Calculates each line of fit for each run of data
p2 = f(x,2);
p3 = f(x,3);
p4 = f(x,4);

figure

subplot(4,1,1) 
errorbar(x,y(:,1),sigma);hold on 
plot(x,p1)
hold off
string = sprintf('y = %.02fx + %.02f',m(1),b(1));
xlabel('x');ylabel('y');legend('run1',string)

subplot(4,1,2)
hold on
errorbar(x,y(:,2),sigma)
plot(x,p2)
hold off
string = sprintf('y = %.02fx + %.02f',m(2),b(2));
xlabel('x');ylabel('y');legend('run2',string)

subplot(4,1,3)
hold on
errorbar(x,y(:,3),sigma)
plot(x,p3)
hold off
string = sprintf('y = %.02fx + %.02f',m(3),b(3));
xlabel('x');ylabel('y');legend('run3',string)

subplot(4,1,4)
hold on
errorbar(x,y(:,4),sigma)
plot(x,p4)
hold off
string = sprintf('y = %.02fx + %.02f',m(4),b(4));
xlabel('x');ylabel('y');legend('run4',string)

%//////////////  Question 2  /////////////////////
x = [ 5.1 5.5 5.9 6.8 7.4 7.5 8.6 9.4];
y = [200 300 400 500 600 700 800 900];
mu_x = sum(x)/length(x);
mu_y = sum(y)/length(y);
sigma_x = sqrt(1/length(x)*sum((x - mu_x).^2));
sigma_y = sqrt(1/length(y)*sum((y - mu_y).^2));

s = (x - mu_x);
m = sum(s .* (y - mu_y))/sum(s.^2);
b = mu_y - m.*mu_x;
s = [sigma_y sigma_y sigma_y sigma_y sigma_y sigma_y  sigma_y sigma_y];
figure
hold on
errorbar(x,y,s)
plot(x,m*x + b)
string = sprintf('y = %.02fx + %.02f',m,b);
xlabel('Extension (cm)');ylabel('Mass(kg)');legend('data',string')



        
        
    
