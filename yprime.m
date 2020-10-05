function f = yprime(t,P)
global alpha
global count
f = P*(-1 + P - (alpha*P^2));
count = count + 1;
end
