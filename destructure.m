% USAGE:
%    [...] = destructure(x)
%
% DESCRIPTION:
%    Perform simple array destructuring.
%
% EXAMPLE:
%    >> [a, b] = destructure(1 : 4)
%
%    a =
%         1
%
%    b =
%         2
function varargout = destructure(x)
    nOut = nargout();

    if iscell(x)
        varargout = x(1 : nOut);
    else
        varargout = num2cell(x(1 : nOut));
    end
end
