% USAGE:
%    vOut = fillgaps(vInput, nMinGap)
%
% DESCRIPTION:
%    Fill in gaps in a logical vector between `true` values.
%
% ARGUMENTS:
%    vInput
%       A logical vector
%    nMinGap
%       The maximum-sized gap to fill; yeah, that's a weird label for this value
function vOut = fillgaps(vInput, nMinGap)
    % Retrieve the gaps and their sizes.
    cellGaps = getIntervals(~vInput, true);
    vGapSizes = cellfun(@length, cellGaps);

    % The indices that we want to fill in are those in the gaps where the gap
    % size is too small.
    vFilled = [cellGaps{vGapSizes <= nMinGap}];

    % Now, the output is just the input with the holes plugged.
    vOut = vInput;
    vOut(vFilled) = true;
end