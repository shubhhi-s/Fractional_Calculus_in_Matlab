% An example on how to use fderiv and fint functions

clc;
close all;
clear all;

ts = 0.01;
n = 170;

t = 0:ts:2;
x = t;

figure;
hold on;
plot(t, x)

x_d = fderiv(x, 1, n, ts);
x_i = fint(x, 1,   n, ts);
plot(t, x_d)
plot(t, x_i)

legend('x', 'xd', 'xint')
xlabel('t');
ylabel('x(t)');
