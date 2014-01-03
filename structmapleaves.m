% USAGE:
%    stctOut = structmapleaves(fcnMap, stctIn)
%
% DESCRIPTION:
%    Apply a function to every leaf of a structure. A leaf in a (nested)
%    structure is a descendant (a field, or a field of a field, etc.) that is
%    not itself a structure.
%
% ARGUMENTS:
%    fcnMap
%       The function to apply to every leaf of the provided structure
%    stctIn
%       The structure
%
% EXAMPLE:
%    >> stctIn.field1 = 4;
%    >> stctIn.field2.a = 5;
%    >> stctIn.field2.b = 6;
%    >> stctOut = structmapleaves(@(x) x^2, stctIn);
%
%    stctOut =
%
%        field1: 16
%        field2: [1x1 struct]
%
%    >> stctOut.field2
%
%    ans =
%
%        a: 25
%        b: 36
function stctOut = structmapleaves(fcnMap, stctIn)
    stctOut = stctIn;

    if isa(stctIn, 'struct')
        cellFields = fieldnames(stctOut);

        for i = 1 : length(cellFields)
            strField = cellFields{i};
            stctOut.(strField) = structmapleaves(fcnMap, stctOut.(strField));
        end
    else
        stctOut = fcnMap(stctIn);
    end
end
