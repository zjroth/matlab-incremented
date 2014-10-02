% USAGE:
%    [cellSorted, vOrder] = sortcell(cellIn, fcnSortBy, ...)
%
% DESCRIPTION:
%    Sort the contents of a cell array
%
% ARGUMENTS:
%    cellIn
%       The cell array to be sorted
%    fcnSortBy
%       A function that returns a numeric output for each entry of the input
%       cell array
%    ...
%       Additional input arguments will behave as if passed to `sort`
%
% RETURN:
%    cellSorted
%       The sorted cell array
%    vOrder
%       The sorting order (i.e., `cellSorted = cellIn(vOrder)`)
function [cellSorted, vOrder] = sortcell(cellIn, fcnSortBy, varargin)
    vFunctionOutput = cellfun(fcnSortBy, cellIn);
    [~, vOrder] = sort(vFunctionOutput, varargin{:});
    cellSorted = cellIn(vOrder);
end
