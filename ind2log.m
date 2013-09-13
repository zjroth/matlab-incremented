% vLogical = ind2log(vIndices, vLengths)
function vLogical = ind2log(vIndices, vLengths)
    vLogical = false([vLengths, 1]);

    assert(min(vIndices) > 0 && max(vIndices) <= numel(vLogical), ...
           'ind2log: index out of bounds');

    vLogical(vIndices) = true;
end