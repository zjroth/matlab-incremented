function mtxMap = cmap(mtxColors, nMapSize)
    nColors = size(mtxColors, 1);
    assert(mod(nMapSize, nColors - 1) == 0, ...
           'cmap: the number of colors minus one must divide the map size');

    nTmp = nMapSize / (nColors - 1);
    mtxMap = zeros(nMapSize, 3);

    for i = 1 : nColors - 1
        vIndx = (nTmp * (i - 1)) + (1 : nTmp);
        mtxMap(vIndx, :) = cmap_transition(mtxColors(i, :), mtxColors(i + 1, :), nTmp);
    end
end

function mtxColors = cmap_transition(vLow, vHigh, nMapSize)
    vPerc = col(linspace(0, 1, nMapSize));

    mtxColors = bsxfun(@times, 1 - vPerc, row(vLow)) + ...
        bsxfun(@times, vPerc, row(vHigh));
end
