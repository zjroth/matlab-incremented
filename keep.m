% USAGE:
%    [vOut, mtxKept] = keep(fcnTest, mtxIn)
%
% DESCRIPTION:
%    Keep all entries of the given array that meet the given condition
%
% ARGUMENTS:
%    fcnTest
%       A function that determines which entries are to be kept. An
%       entry is kept if this returns true.
%    mtxIn
%       The input array
%
% RETURNS:
%    vOut
%       The ouput vector. This will have one entry for each element of the
%       input array that was kept.
%    mtxKept
%       A logical matrix indicating which entries have been kept
function [vOut, mtxKept] = keep(fcnTest, mtxIn)
    if iscell(mtxIn)
        mtxKept = cellfun(fcnTest, mtxIn);
    else
        mtxKept = arrayfun(fcnTest, mtxIn);
    end

    vOut = mtxIn(mtxKept);
end