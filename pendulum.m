clc
clear all
t=[0 20];
theta0=[0 3];
l=1;
[t,theta]=ode45('odese',t,theta0)
figure(1)
plot(t,theta(:,1));
xlabel('time')
ylabel('disp')
figure(2)
plot(t,theta(:,2))
xlabel('time')
ylabel('velocity')
theta2=theta(:,1);
figure(3)
for i=1:length(t)
    plot([-1,1],[0,0],'r');
    disp=theta(i,1);
    hold on
    plot([0,l*sin(disp)] ,[0,-l*cos(disp)],'b');
    hold on
    plot(l*sin(disp),-l*cos(disp),'marker','o','MarkerSize',20)
    m(i)=getframe(gcf)
end
movie(m)
videofile=VideoWriter('forward_kinematics.avi');
open(videofile)
writeVideo(videofile,m);
close(videofile);