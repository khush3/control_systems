close all;
clear; clc;
Gp = series(feedback(tf(2,[1 3]), 1), tf(-2,[-1 1]));
H = tf(1, [1 10]);
rlocus(Gp*H);