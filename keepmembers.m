% USAGE:
%    [vOut, mtxKept] = keepmembers(mtxIn, vToKeep)
%
% DESCRIPTION:
%    Keep all entries of the first array that are members of the second.
%
% ARGUMENTS:
%    mtxIn
%       A matrix of values
%    vToKeep
%       A list of allowed values
%
% RETURNS:
%    vOut
%       The ouput vector. This will have one entry for each element of the
%       input array that was kept.
%    mtxKept
%       A logical matrix indicating which entries have been kept
%
% EXAMPLE:
%    >> [a, b] = keepmembers([1, 1, 1, 2, 3, 2, 3], (1 : 2))
%
%    a =
%
%         1     1     1     2     2
%
%    b =
%
%         1     1     1     1     0     1     0
function [vOut, mtxKept] = keepmembers(mtxIn, vToKeep)
    mtxKept = ismember(mtxIn, vToKeep);
    vOut = mtxIn(mtxKept);
end
