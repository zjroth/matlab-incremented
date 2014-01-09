function mtxPadded = pad(mtxIn, vPadSize, dPadWith)
    vSizeIn = size(mtxIn);

    mtxPadded = zeros(vSizeIn + 2 * vPadSize) + dPadWith;

    vRows = vPadSize(1) + 1 : vPadSize(1) + vSizeIn(1);
    vCols = vPadSize(2) + 1 : vPadSize(2) + vSizeIn(2);

    mtxPadded(vRows, vCols) = mtxIn;
end
