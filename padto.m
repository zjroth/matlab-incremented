function mtxPadded = padto(mtxIn, vSize, strDir)
    vSizeIn = size(mtxIn);

    if nargin == 2 || strcmp(strDir, 'both')
        vPadSize = floor((vSize - vSizeIn) ./ 2);

        vRows = vPadSize(1) + 1 : vPadSize(1) + vSizeIn(1);
        vCols = vPadSize(2) + 1 : vPadSize(2) + vSizeIn(2);

        mtxPadded = zeros(vSize);
        mtxPadded(vRows, vCols) = mtxIn;
    elseif strcmp(strDir, 'end')
        mtxPadded = zeros(vSize);
        mtxPadded(1 : vSizeIn(1), 1 : vSizeIn(2)) = mtxIn;
    end
end
