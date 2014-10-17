% USAGE:
%    vOut = normalize(vIn, p)
%
% DESCRIPTION:
%    Normalize a vector
function vOut = normalize(vIn, p)
    assert(isvector(vIn), 'normalize: the input must be a vector');

    if nargin < 2
        p = 2;
    end

    vOut = vIn / norm(vIn, p);
end
