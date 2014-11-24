% USAGE:
%    b = isconstant(x)
%
% DESCRIPTION:
%    Determine whether all entries of an array are equal
function b = isconstant(x)
    if isempty(x)
        b = true;
    else
        b = all(x(:) == x(1));
    end
end
