% vVals = triuVals(mtxIn, nDiag)
function vVals = triuVals(mtxIn, nDiag)
    if nargin < 2
        nDiag = 0;
    end

    vVals = mtxIn(triu(true(size(mtxIn)), nDiag));
end