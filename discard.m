%
% USAGE:
%
%    [vOut, mtxDiscarded] = discard(fcnTest, mtxIn)
%
% DESCRIPTION:
%
%    Discard all entries of the given array that meet the given condition
%
% ARGUMENTS:
%
%    fcnTest
%
%       A function that determines which entries are to be discarded. An
%       entry is discarded if this returns true.
%
%    mtxIn
%
%       The input array
%
% RETURNS:
%
%    vOut
%
%       The ouput vector. This will have one entry for each element of the
%       input array that was not discarded.
%
%    mtxDiscarded
%
%       A logical matrix indicating which entries have been discarded
%
function [vOut, mtxDiscarded] = discard(fcnTest, mtxIn)
    mtxDiscarded = arrayfun(fcnTest, mtxIn);
    vOut = mtxIn(~mtxDiscarded);
end