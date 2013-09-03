% bIsSymmetric = issymmetric(mtxIn)
function bIsSymmetric = issymmetric(mtxIn)
    bIsSymmetric = isequal(mtxIn, mtxIn.');
end