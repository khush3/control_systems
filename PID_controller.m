close all; clear; clc;

Gp = tf(400,[1 50 0]);
KP = [2, 10, 100];
KD = [0.1, 0.9, 2];

for k = 1:3
%   P controller
    Gp_P = feedback(series(Gp, tf(KP(k))), 1);
    subplot(3,3,k)
    step(Gp_P);
    title(sprintf('P controller for Kp: %.1f | Ki: %.1f | Kd: %.1f', KP(k), 0, 0));
    stepinfo(Gp_P)

%   PI controller
    Gp_PI = feedback(series(Gp, tf([4, (KP(k)/10)],[1 0])), 1);
    subplot(3,3,k+3)
    step(Gp_PI);
    title(sprintf('PI controller for Kp: %.1f | Ki: %.1f | Kd: %.1f', 4, KP(k)/10, 0));
    stepinfo(Gp_PI)

%   PD controller
%     Gp_PD = feedback(series(Gp, tf([KD(k), 100], 1)), 1);
%     subplot(4,3,k+6)
%     step(Gp_PD);
%     title(sprintf('PD controller for Kd: %.1f | Ki: %.1f | Kd: %.1f', 100, 0, KD(k)));
%     stepinfo(Gp_PD)

%   PID controller
    Gp_PID = feedback(series(Gp, tf([KD(k), 100, 10], [1 0])), 1);
    subplot(3,3,k+6)
    step(Gp_PID);
    title(sprintf('PID controller for Kd: %.1f | Ki: %.1f | Kd: %.1f', 100, 10, KD(k)));
    stepinfo(Gp_PID)

end
