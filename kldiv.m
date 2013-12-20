% USAGE:
%
%    dKL = kldiv(p, q)
%
% DESCRIPTION:
%
%    Compute the Kullback-Leibler divergence of q from p. Note that
%    this is an asymmetric function.
%
% PARAMETERS:
%
%    p, q
%
%       The distributions. These are vectors of equal length; each of
%       these should sum to 1, but no checking is done.
function dKL = kldiv(p, q)
    assert(isvector(p) && isvector(q) && length(p) == length(q), ...
           'kldiv: distributions must be vectors of the same length');

    % The KL-divergence is only defined if p(i) is zero whenever q(i) is zero.
    if any(p(q == 0))
        dKL = NaN;
    else
        % Consider only those entries with non-zero probabilities.
        vNonzero = logical(p);
        p = p / sum(p);
        q = q / sum(q);
        dKL = log2(row(p(vNonzero)) ./ row(q(vNonzero))) * col(p(vNonzero));
    end
end
