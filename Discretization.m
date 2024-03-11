clear all
clc
close all
x=pi/3;
dx=pi/30;
analytical_solution=(x^3*cos(x)-sin(x)*x^2)/6;
a=sin(x)/x^3;
b=sin(x+dx)/(x+dx)^3;
c=sin(x-dx)/(x-dx)^3;
first_order=(b-a)/dx
firstorder_error=abs(first_order-analytical_solution)
second_order=(b-c)/2*dx
second_ordererror=abs(second_order-analytical_solution)
fourth_order=sin(x-2*dx)/(x-2*dx)^2-8*c+8*b+sin(x+2*dx)/(x+2*dx)
fourtherror=abs(fourth_order-analytical_solution)
p=[1 2 4];
q=[firstorder_error second_ordererror fourtherror];
figure(1)
plot(p,q)
xlabel('order of approximation')
ylabel('error')
hold on
r=[analytical_solution analytical_solution analytical_solution]
plot(p,r)
legend('exact','approx')