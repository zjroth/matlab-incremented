% USAGE:
%    dKL = kldiv(p, q)
%
% DESCRIPTION:
%    Compute the (base-2) Kullback-Leibler divergence D(P || Q), which measures
%    the expected extra information needed to encode samples from P while using
%    a code based on Q.
%
% PARAMETERS:
%    p, q
%       The distributions, i.e., non-negative vectors of equal length. Each will
%       be normalized to ensure that its entries sum to 1.
function dKL = kldiv(p, q)
    assert(isvector(p) && isvector(q) && length(p) == length(q), ...
           'kldiv: distributions must be vectors of the same length');
    assert(all(p >= 0) && all(q >= 0), ...
           'kldiv: input vectors must be non-negative');

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
