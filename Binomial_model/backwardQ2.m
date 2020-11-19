function [outputV] = backwardQ2(V)
N = 10;
for n = N+1:-1:2
    q = (0.102 * (n-2) + 1.632) / (0.2 * (n-2) + 2.1);
    for m = 1: 2 ^ (n-2)
        V(n-1, m) = 1 / 1.002 * (q * V(n, 2*m) + (1-q) * V(n, 2*m-1));
    end
end
outputV = V;
end