%
% USAGE:
%
%    [vOut, mtxExtracted] = extract(fcnTest, mtxIn)
%
% DESCRIPTION:
%
%    Extract all entries of the given array that meet the given condition
%
% ARGUMENTS:
%
%    fcnTest
%
%       A function that determines which entries are to be extracted. An
%       entry is extracted if this returns true.
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
%       input array that was extracted.
%
%    mtxExtracted
%
%       A logical matrix indicating which entries have been extracted
%
function [vOut, mtxExtracted] = extract(fcnTest, mtxIn)
    mtxExtracted = arrayfun(fcnTest, mtxIn);
    vOut = mtxIn(mtxExtracted);
end