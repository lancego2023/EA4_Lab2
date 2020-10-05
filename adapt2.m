clear
clc

global alpha
global count 

count = 0;

%change these
t0 = 0;
tfin = 100;
h = 1;
yinit = 0.5;
alpha = 0;
epsilson = 0.005;
hraise = 1.1;
hcut = 1.1;
hbig = 10;
hsmall = 0.1;

%don't change these
p0 = yinit;
P = p0;
T = t0;
while T+h <= tfin
    % improved euler here:
    k1 = yprime(T,P);
    ylow = P + h*k1;
    k2 = yprime(T+h,ylow);
    k = (k1 + k2)/2;
    
    Tm = T + h;
    yhigh = P + h*k;
    if abs(yhigh-ylow)/abs(yhigh) > epsilson
        h = h/hcut;
    else
        P = yhigh;
        h = h*hraise;
        T = T + h;
    end
    
    if h > hbig || h < hsmall
        break
    end
end    
fprintf('Final Result: %f',P)
