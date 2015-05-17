% USAGE:
%    mtxRanges = consecutive(vIn)
%
% DESCRIPTION:
%    Find all ranges of consecutive integers.
%
% ARGUMENTS:
%    vIn
%       The vector in which to find the intervals
%
% RETURN:
%    mtxRanges
%       A list of the ranges as a 2-column matrix (start and end values).
%
% EXAMPLES:
%    >> consecutive([1:3, 5:20, 5, 3:10])
%
%    ans =
%
%         1     3
%         5    20
%         5     5
%         3    10
function mtxRanges = consecutive(vIn)
    assert(all(isint(vIn)), 'consecutive: input vector must be integer-valued');

    vInput = row(vIn);
    v = (1 : length(vInput)) - vInput;
    mtxIntervals = constant(v, 0.5);
    mtxRanges = vInput(mtxIntervals);
end
