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
    error_approx = error_approximation(T,P,yhigh,ylow,h);
    if error_approx < epsilon
        P = yprime(T+h,P+ylow);
        T = t + h;
        if h*hraise <= hbig
            h = h * hraise;
        end
    else
        while error_approximation(T,P,yhigh,ylow,h) >= epsilon
            if h/hcut >= hsmall
                h = h/hcut
            else
                quit(1,"Can not compute requested tolerance within supplied minimum step size")
            end
        end
        P = yprime(T+h,P+ylow);
        T = t + h;
    end
end    
fprintf('Final Result: %f',P)

%intermediate calculation functions
function [error_approx] = error_approximation(T,P,yhigh,ylow,h)
ylow = yprime(T,P);
yhigh = yprime(T+h,P+ylow);
error_approx = abs(yhigh-ylow)/abs(yhigh);
end
