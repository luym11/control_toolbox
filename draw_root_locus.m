% MAY 2 2017

% build tf
s = tf('s'); 

GH = 1/(s * (s + 4) * (s^2 + 4*s + 20)); 

% another way to do tf
num = 1; 
den = [1 8 36 80 0]; 
GH2 = tf(num, den);

% another method
GH3 = zpk([], [0, -4, -2+4i, -2-4i], 1); 

% see poles and zeros
% ploe(GH); 
% zero(GH);
% pzmap(GH); 

%% plot pzmap of colsed loop system
% 
% for k = 1:10:101
%     pzmap(feedback(GH*k,1)); 
%     hold on; 
% end

% easier method
rlocus(GH); 


% control system toolbox in Matlab
% sisotool(GH); 
% GH_stacked = stack(1, GH1, GH2);  % use to design compensator for some
% TF's