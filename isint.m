% USAGE:
%    b = isint(x)
%
% DESCRIPTION:
%    Determine whether a (floating-point) number is an integer. This is
%    equivalent to testing whether the floor of the number is equal to the
%    number.
function b = isint(x)
    b = (floor(x) == x);
end
