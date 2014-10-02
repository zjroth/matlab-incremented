% USAGE:
%    cellRows = rows(mtxIn)
%
% DESCRIPTION:
%    Return the rows of a matrix as the entries of a cell array.
function cellRows = rows(mtxIn)
    [nRows, nCols] = size(mtxIn);
    cellRows = mat2cell(mtxIn, ones(nRows, 1), nCols);
end
