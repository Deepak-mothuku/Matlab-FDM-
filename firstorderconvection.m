clear all
clc
l=1;
c=1;
n=[20 40 80 160];
dt=0.01;
endt=0.4;   
for k=1:4
    x=linspace(0,1,n(k));
    uold=ones(1,n(k));
    y=find(x>0.1 & x<0.3)
    n_start=y(1);
    n_end=y(end);
    uold(n_start:n_end)=2;
    uinitial=uold;
    u=uold;
    dx=x(2)-x(1)
    n_t=(endt/dt)+1;
    for j=2:n_t
        for i=2:n(k)
            u(i)=uold(i)-(dt*c/dx)*(uold(i)-uold(i-1));
        end
        uold=u;
    end
    max_velocity=max(u)
    figure(1)
    subplot(2,1,1)
    plot(x,uinitial,'r');
    xlabel('x')
    ylabel('given_velocity')
    subplot(2,1,2)
    plot(x,u,'b')
    legend(['Number of nodes = ',num2str(n(k))])
    xlabel('x')
    ylabel('convected_velocity')
    pause(15)
end



