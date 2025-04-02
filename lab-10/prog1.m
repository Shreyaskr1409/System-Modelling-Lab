clc;
clear;
close all;

syms y1(x) y2(x)

% First-Order ODE Solution
ode1 = diff(y1,x) + 3*y1 == exp(-2*x);
ic1 = y1(0) == 0;
y1_sol = dsolve(ode1, ic1);

% Second-Order ODE Solution
ode2 = diff(y2,x,2) + 4*diff(y2,x) + 3*y2 == sin(x);
ic2 = [y2(0)==0, subs(diff(y2,x),x,0)==0];
y2_sol = dsolve(ode2, ic2);

% Display solutions
disp('First-Order Solution:')
pretty(y1_sol)
disp('Second-Order Solution:') 
pretty(y2_sol)

% Visualization
figure
subplot(2,1,1)
fplot(y1_sol, [0 10], 'LineWidth', 2)
title('1st Order: dy/dx + 3y = e^{-2x}')
xlabel('x'), ylabel('y1(x)'), grid on

subplot(2,1,2) 
fplot(y2_sol, [0 10], 'LineWidth', 2)
title('2nd Order: d²y/dx² + 4dy/dx + 3y = sin(x)')
xlabel('x'), ylabel('y2(x)'), grid on