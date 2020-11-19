function [output, points] = backwardQ3(V)
N = 10;
points = [];

for n = N+1: -1: 2
    q = (0.102 * (n-2) + 1.632) / (0.2 * (n-2) + 2.1);
    for m = 1: 2 ^ (n-2)
        EMM = 1/1.002 * (q * V(n, 2*m) + (1-q) * V(n, 2*m-1));
        if EMM >= V(n-1, m)
            V(n-1, m) = EMM;
        else
            % else it will be the exercise point
            points = [points; n-2, m-1];
        end
    end
end

output = V;
end