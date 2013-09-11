% mtxIntervals = getIntervals(vIn, asCellArray)
function intervals = getIntervals(vIn, bAsCellArray)
    % By default, do not return a cell array.
    if nargin < 2
       bAsCellArray = false;
    end

    % We want to work with a binary column vector. Once we have that, find the
    % indices of the jumps in that vector (i.e., basically the first index of
    % each interval). Note that the `+1` is there due to `diff` returning a
    % vector that is one shorter than its input vector.
    vSupport = col(logical(vIn));
    vJumps = find(diff(vSupport)) + 1;

    % The first interval starts at index one; the rest start at the indices in
    % `vJumps`. The last interval ends at the last index of `vSupport`; the rest
    % end immediately before the indices in `vJumps`.
    vStarts = [1; vJumps(1 : end)];
    vEnds = [vJumps(1 : end) - 1; length(vSupport)];

    % We only want the intervals where vSupport is true. Since we're working
    % with a binary vector, every other interval is true.
    nFirstPositiveInterval = 1 + ~vSupport(1);
    vStarts = vStarts(nFirstPositiveInterval : 2 : end);
    vEnds = vEnds(nFirstPositiveInterval : 2 : end);

    % Assign to the return variable.
    if bAsCellArray
        % If requested, return a cell array where each entry is the full list of
        % indices for an interval.
        intervals = arrayfun(@colon, vStarts, vEnds, 'Uniform', false);
    else
        % ...otherwise, simply piece the starting indices and the ending indices
        % together to get the matrix where each row represents an interval.
        intervals = [vStarts, vEnds];
    end
end
