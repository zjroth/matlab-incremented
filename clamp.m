% USAGE:
%    y = clamp(x, a, b)
%
% DESCRIPTION:
%    Round the entries of the given array to lie in the interval [a, b]
function y = clamp(x, a, b)
    y = max(a, min(x, b));
end
