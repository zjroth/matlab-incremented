% vLogical = ind2log(vIndices, nLength)
function vLogical = ind2log(vIndices, nLength)
    vLogical = false(nLength, 1);
    vLogical(vIndices) = true;
end