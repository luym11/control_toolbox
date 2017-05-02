% percent overshoot
PO = 15; 
% damping ratio zeta
zeta = abs(log(PO/100)) / ( sqrt( pi^2 + log(PO/10)^2)); 
% define 2nd order tf, set natural freqency 1
w = 1; 
s = tf('s'); 
% create transfer function
second_order = w^2/(s^2 + 2*zeta * w *s + w^2); 

% step(second_order);
for w = 0.5:0.5:2
    second_order = w^2/(s^2 + 2*zeta * w *s + w^2); 
    % step(second_order);
    pzmap(second_order);
    hold all; 
end
