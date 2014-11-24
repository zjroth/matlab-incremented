% USAGE:
%    H = entropy(P)
%
% DESCRIPTION:
%    Find the (base-2) entropy of the given distribution
%
% ARGUMENTS:
%    P
%       The distribution; for flexibility, this need only be an array containing
%       only non-negative values; treated as `P(:) / sum(P(:))`
function H = entropy(P)
    assert(all(P >= 0), 'entropy: input have only non-negative entries');

    vDistribution = normalize(P(P > 0), 1);
    H = -sum(vDistribution .* log2(vDistribution));
end
