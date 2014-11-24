% USAGE:
%    mtxElements = cartesian(cellSets)
%
% DESCRIPTION:
%    Find the cartesian product of the given sets/vectors
%
% ARGUMENTS:
%    cellSets
%       A cell array containing (non-empty) vectors
%
% RETURN:
%    mtxElements
%       A matrix whose rows are the elements of the cartesian product of the
%       provided sets
%
% EXAMPLE:
%    >> cartesian({(1 : 2), 3, (4 : 6)})
%
%    ans =
%
%         1     3     4
%         2     3     4
%         1     3     5
%         2     3     5
%         1     3     6
%         2     3     6
function mtxElements = cartesian(cellSets)
    % Make sure that each provided "set" is a vector.
    assert(all(cellfun(@isvector, cellSets)));

    % The function `ndgrid` essentially returns the cartesian product of the
    % provided sets, but it does so by listing the values in multi-dimensional
    % arrays. Ultimately, the i-th return variable lists the values that the
    % i-th set takes on in the elements of the cartesian product.
    cellGridValues = cell(1, length(cellSets));
    [cellGridValues{:}] = ndgrid(cellSets{:});

    % Take the above-found multi-dimensional arrays and concatenate them into
    % a matrix in which the i-th return variable corresponds to the i-th
    % column.
    mtxElements = cell2mat(cellfcn(@col, cellGridValues));
end
