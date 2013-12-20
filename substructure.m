%
% USAGE:
%
%    stctSub = substructure(stctIn, strField1, ..., <strFieldN>)
%
% DESCRIPTION:
%
%    Return the "sub-structure" of the provided structure that contains the
%    provided list of
%
% ARGUMENTS:
%
%    stctIn
%
%       The structure from which to extract a sub-structure.
%
%    strField1, ..., <strFieldN>
%
%       Strings designating the fields that you want to extract.
%
function stctSub = substructure(stctIn, varargin)
    stctSub = [];

    for i = 1 : length(varargin)
        strField = varargin{i};
        stctSub.(strField) = stctIn.(strField);
    end
end
