clear all
clc
close all 
x=pi/3;
dx=[pi/4000 pi/40];
analytical_solution=(x^3*cos(x)-sin(x)*x^2)/6;
a=sin(x)/x^3;
for i=1:2
b=sin(x+dx(i))/(x+dx(i))^3;
c=sin(x-dx(i))/(x-dx(i))^3;
first_order(i)=(b-a)/dx(i)
firstorder_error(i)=abs(first_order(i)-analytical_solution)
second_order(i)=(b-c)/2*dx(i)
second_ordererror(i)=abs(second_order(i)-analytical_solution)
fourth_order(i)=sin(x-2*dx(i))/(x-2*dx(i))^2-8*c+8*b+sin(x+2*dx(i))/(x+2*dx(i))
fourtherror(i)=abs(fourth_order(i)-analytical_solution)
end
figure(1)
plot(dx,firstorder_error,'color','r')
hold on
plot(dx,second_ordererror,'color','g')
hold on
plot(dx,fourtherror,'color','k')
xlabel('dx')
ylabel('error')
legend('firstorder_error','secondorder_error','fourthorder_error')
slope_first_order=diff(firstorder_error)/diff(dx)
slope_second_order=diff(second_ordererror)/diff(dx)
slope_fourth_order=diff(fourtherror)/diff(dx)
