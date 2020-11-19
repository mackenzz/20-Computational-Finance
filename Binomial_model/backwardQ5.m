function [outputV] = backwardQ5(V, k)
N = 20 * k;
r = 0.02;
deltaT = 1/N;
u = 1 + log(1.1) / sqrt(k);
d = 1 - log(1.1) / sqrt(k);
q = (1 + r * deltaT - d) / (u - d);

for n = N + 1: -1: 2
    for m = 1: n - 1
        V(n, m) = (q * V(n+1, m+1) + (1-q) * V(n+1, m)) / (1 + r*deltaT);
    end
end

outputV = V;
end