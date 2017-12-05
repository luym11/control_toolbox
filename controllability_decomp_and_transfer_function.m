%% Pr. 2
clear A B C CC; 
A = [2     3     2     1
    -2    -3     0     0
    -2    -2    -4     0
    -2    -2    -2    -5]; 
B = [1; -2; 2; -1];
CC = ctrb(A, B); 
V = orth(CC); 
W = null(CC); 
Tinv = [V, W]; 
T = inv(Tinv); 
A1 = T*A*Tinv; 
B1 = T*B; 

%% Pr. 4
% transfer function of the system
n = [3, 4, -2];
d = [1, 3, 7, 5]; 

% state space representation
[A, B, C, D] = tf2ss(n, d); 
sys = ss(A, B, C, D); 

eigs = eig(A); 

% controllability
CC = ctrb(A,B); 
R = rank(CC); 

% place poles
ps = [-4, -4, -5]; 
K = acker(A, B, ps); % ackermann formula

% run simulation and plot
t = 0:0.05:10; 
u = zeros(size(t)); 
x0 = [10; 0; 0]; 
[y, t, x] = lsim(sys, u, t, x0); 

figure();
sys_fb = ss(A-B*K, B, C, D); 
[y_fb, t, x_fb] = lsim(sys_fb, u, t, x0); 
plot(t, y); 
hold on; 
plot(t, y_fb); 
title('Open-loop vs closed-loop performance for zero input with non-zero init state')
xlabel('t'); 
grid on; 

% note that initial state effects the reaction speed and overshoot