% USAGE:
%    cellLeaves = structleaves(stctIn, <strField1>, ..., <strFieldN>)
%
% DESCRIPTION:
%    Return the leaves of a (potentially nested) structure array as a cell
%    array. The returned leaves are ordered in a similar manner as to how a
%    directory structure would look as a tree view.
%
% ARGUMENTS:
%    stctIn
%       The structure from which to extract a sub-structure.
%    <strField1>, ..., <strFieldN>
%       Strings designating the fields that you want to extract, as in
%       `substructure`; if no fields are specified, then the entire structure is
%       used.
function cellLeaves = structleaves(stctIn, varargin)
    if length(varargin) > 0
        cellLeaves = getleaves(substructure(stctIn, varargin{:}));
    else
        cellLeaves = getleaves(stctIn);
    end
end

function cellLeaves = getleaves(stctIn)
    if isa(stctIn, 'struct')
        cellFields = fieldnames(stctIn);
        cellLeaves = {};

        for i = 1 : length(cellFields)
            stctField = stctIn.(cellFields{i});
            cellLeaves = vertcat(cellLeaves, getleaves(stctField));
        end
    else
        cellLeaves = {stctIn};
    end
end
