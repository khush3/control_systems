close all;
clear; clc;

k = [10, 20, 50, 100];
process = tf(1, [1, 1, 0]);

for i = 1:4
    controller = tf([11, k(i)],1);
    system = feedback(series(controller, process), 1);
    title(sprintf('Without disturbance k = %d', k(i)));
    subplot(4, 3, 1 + 3*(i-1))
    step(system);
    stepinfo(system)

    controller = tf([11, k(i)],1);
    D_system = feedback(process, controller);
    title(sprintf('Only disturbance k = %d', k(i)));
    subplot(4,3, 2 + 3*(i-1))
    step(D_system);
    stepinfo(D_system)

    controller = tf([11, k(i)],1);
    D_system = feedback(process, controller);
    system = feedback(series(controller, process), 1);
    title(sprintf('With disturbance k = %d', k(i)));
    subplot(4,3, 3 + 3*(i-1))
    step(system + D_system);
    stepinfo(system + D_system)
end
