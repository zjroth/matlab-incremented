% USAGE:
%    arrIndicator = indicator(mtxIndices, <vDims>)
%
% DESCRIPTION:
%    Create an indicator array from a list of indices
%
% ARGUMENTS:
%    mtxIndices
%       A matrix, each row of which contains indices into an array
%    vDims (default: minimum dimensions necessary)
%       A list of dimensions for the output array
%
% RETURN:
%    arrIndicator
%       The reqeusted indicator array
%
% NOTE:
%    When the provided list of indices is a row vector, the vector is treated
%    as a matrix, i.e., as specifying a single index into a multi-dimensional
%    array. When the provided list of indices is a column vector, the vector is
%    treated as containing linear indices. This setup allows for consistency
%    with the more general setup of providing indices as rows of a matrix.
function arrIndicator = indicator(mtxIndices, vDims)
    % All indices need to be positive.
    assert(all(mtxIndices(:) > 0), 'indicator: all indices must be positive');

    % No output dimensions were provided, making our work easy.
    if nargin < 2 || isempty(vDims)
        arrIndicator = (0 < accumarray(mtxIndices, 1));
    elseif iscolumn(mtxIndices)
        % We're using linear indexing because the input is a column vector.
        % Make sure that no index is too large.
        assert(max(mtxIndices) <= prod(vDims), ...
               'indicator: index out of range');

        arrIndicator = false([vDims, 1]);
        arrIndicator(mtxIndices) = true;
    else
        % All of the assertions below are basically to guarantee that the
        % data is in a format that `accumarray` likes.
        assert(isvector(vDims));
        vDims = row(vDims);

        assert(length(vDims) == size(mtxIndices, 2), ...
               ['indicator: the number of columns of `mtxIndices` must ' ...
                'equal the number of entries in `vDims`']);
        assert(all(max(mtxIndices) <= vDims), ...
               ['indicator: index out of range; ensure that indices lie ' ...
                'within the specified dimensions'])

        arrIndicator = (0 < accumarray(mtxIndices, 1, vDims));
    end
end
