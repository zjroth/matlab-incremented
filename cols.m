% USAGE:
%    cellCols = cols(mtxIn)
%
% DESCRIPTION:
%    Return the columns of a matrix as the entries of a cell array.
function cellCols = cols(mtxIn)
    [nRows, nCols] = size(mtxIn);
    cellCols = mat2cell(mtxIn, nRows, ones(nCols, 1));
end
