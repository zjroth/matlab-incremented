% USAGE:
%    dJS = jsdiv(p, q)
%
% DESCRIPTION:
%    Compute the Jensen-Shannon divergence between two distributions.
%
% PARAMETERS:
%    p, q
%       The distributions. These are vectors of equal length; each of
%       these should sum to 1, but no checking is done.
function dJS = jsdiv(p, q)
    m = (p(:) + q(:)) / 2;
    dJS = (kldiv(p, m) + kldiv(q, m)) / 2;
end
