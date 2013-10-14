%
% USAGE:
%
%    cellOut = cellmap(fcnMap, cellIn)
%
% DESCRIPTION:
%
%    Map the function across the given cell array and produce a cell array of
%    the output.
%
% ARGUMENTS:
%
%    fcnMap
%
%       The function to apply to individual cells
%
%    cellIn
%
%       The input cell array whose cells the function should be applied to
%
% RETURNS:
%
%    cellOut
%
%       The ouput cell array whose entries are the output of the function.
%       This is the same size as the input.
%
function cellOut = cellmap(fcnMap, cellIn)
    cellOut = cellfun(fcnMap, cellIn, 'UniformOutput', false);
end