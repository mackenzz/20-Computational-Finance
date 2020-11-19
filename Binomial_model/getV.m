function [outputV] = getV(k)
r = 0.02;
N=20 *k;
u = 1+log(1.1) / sqrt(k);
d = 1-log(1.1) / sqrt(k);
deltaT = 1 / N;
S = zeros(201,201);
V = zeros(201,201);
p = (1+r*deltaT - d)/(u - d);
S(1,1) = 100;

for n = 1 : (20 * k)
    for m = 1: n
        S(n+1, m) = S(n, m) * d;
    end
    S(n+1,n+1) = S(n,n) * u;
end

for n = 1 : (20 * k) + 1
    V(20*k + 1, n) = max(100 - S(20*k + 1, n), 0);
end

for n = (20 * k) :-1: 1
    for m = 1 : n
        V(n, m) = 1 / (1+r*deltaT) * (p*V(n+1,m+1) + (1-p)*V(n+1,m));
    end
end
outputV = V;
end