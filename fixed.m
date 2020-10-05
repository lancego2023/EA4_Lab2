clear
clc
global alpha %#ok<NUSED>
global count  %#ok<NUSED>

%reads in data, orders computation and printing done
[alpha, h, yinit, tfin] = textread('fixed.dat', '%f %f %f %f',1);
fixed_solver(h,yinit,tfin);


%actual computational work
function [Tvector,Pvector] = fixed_solver(h,yinit,tfin)
global count
count = 0;
%printing of names

%fprintf('Alpha: %f \n',alpha)
fprintf('h: %f \n',h)
fprintf('yinit: %f \n',yinit)
fprintf('tfin: %f \n',tfin)

%optional to change
t0 = 0;

%don't change these
p0 = yinit;
P = p0;
T = t0;
Pvector = [];
Tvector = [];
for i = 1:ceil((tfin-t0)/h)
    if (T + h)>tfin
        h = tfin - T;
    end
    k1 = yprime(T,P);
    k2 = yprime(T+h,P+h*k1);
    k = (k1 + k2)/2;
    Pvector = [Pvector; P];
    Tvector = [Tvector; T];
    T = T + h;
    P = P + h*k;
end

fprintf('Final Result for Y: %f \n',P)
fprintf('Count: %i \n',count)
end


