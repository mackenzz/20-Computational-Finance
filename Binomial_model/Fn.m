function [payoff] = Fn(s)
if s >= 144
    payoff = sqrt(s);
else
    payoff = max((s-88), 0);
end