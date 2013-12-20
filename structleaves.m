% USAGE:
%
%    cellLeaves = structleaves(stctIn)
%
% DESCRIPTION:
%
%    Return the leaves of a (potentially nested) structure array as a cell
%    array. The returned leaves are ordered in a similar manner as to how a
%    directory structure would look as a tree view.
function cellLeaves = structleaves(stctIn)
    if isa(stctIn, 'struct')
        cellFields = fieldnames(stctIn);
        cellLeaves = {};

        for i = 1 : length(cellFields)
            stctField = stctIn.(cellFields{i});
            cellLeaves = vertcat(cellLeaves, structleaves(stctField));
        end
    else
        cellLeaves = {stctIn};
    end
end
