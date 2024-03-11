clear all
close all
clc

l = 1;
c = 1;
n = 80;
t_step = [1e-4 1e-3 1e-2 1e-1];
endt = 0.4;
x = linspace(0, 1, 80);
uold = ones(1, n);
y = find(x > 0.1 & x < 0.3);
n_start = y(1);
n_end = y(end);
uold(n_start:n_end) = 2;
uinitial = uold;
u = uold;
dx = x(2) - x(1)

for k = 1:4
    n_t = (endt / t_step(k)) + 1;
    timestep=t_step(k)
    for j = 2:n_t
        for i = 2:n
            u(i) = uold(i) - (c * t_step(k) / dx) * (uold(i) - uold(i - 1));
        end
        uold = u;
    end
    max_velocity=max(u)

    figure(k)
    subplot(2, 1, 1)
    plot(x, uinitial, 'color', 'r')
    xlabel('x')
    ylabel('given_velocity')
    subplot(2, 1, 2)
    plot(x, u, 'color', 'b')
    xlabel('x')
    ylabel('given_velocity')
    legend(['the time step is ', num2str(t_step(k))])
    pause(15)
end
