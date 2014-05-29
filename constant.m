% USAGE:
%    [mtxIntervals, vValues] = constant(vIn, <dThreshold>)
%
% DESCRIPTION:
%    Find the index intervals where the input vector is constant.
%
% ARGUMENTS:
%    vIn
%       The vector in which to find the intervals
%    dThreshold (default: 0)
%       Values are considered to be the same if their difference (in absolute
%       value) is less than or equal to this parameter.
%
% RETURN:
%    mtxIntervals
%       A list of the intervals as a 2-column matrix (start and end indices).
%    vValues
%       A column vector listing the values of the input corresponding to the
%       rows of `mtxIntervals`.
function [mtxIntervals, vValues] = constant(vIn, dThreshold)
    if nargin < 2
        dThreshold = 0;
    end

    % We want to work with a binary column vector. Once we have that, find the
    % indices of the jumps in that vector (i.e., basically the first index of
    % each interval). Note that the `+1` is there due to `diff` returning a
    % vector that is one shorter than its input vector.
    %vJumps = find(    diff(col(vIn))               ) + 1;
    vJumps = find(abs(diff(col(vIn))) > dThreshold) + 1;

    % The first interval starts at index one; the rest start at the indices in
    % `vJumps`. The last interval ends at the last index of `vSupport`; the rest
    % end immediately before the indices in `vJumps`.
    vStarts = [1; vJumps(1 : end)];
    vEnds = [vJumps(1 : end) - 1; length(vIn)];

    % Simply piece the starting indices and the ending indices together to
    % get the matrix where each row represents an interval.
    mtxIntervals = [vStarts, vEnds];
    vValues = vIn(vStarts);
end
