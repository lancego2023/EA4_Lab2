clear
clc

global alpha
global count 

count = 0;

%change these
t0 = 0;
tfin = 100;
n = 100;
p0 = 0.5;
alpha = 0;

%don't change these
h = (tfin - t0)/n;
P = p0;
T = t0;
for i = 1:n
    k1 = yprime(T,P);
    k2 = yprime(T+h,P+h*k1);
    k = (k1 + k2)/2;
    T = T + h;
    P = P + h*k;
end

fprintf('Final Result: %f',P)