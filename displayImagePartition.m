function displayImagePartition(mtxImage, vPartitionSizesX, vPartitionSizesY)
    if nargin < 2 || isempty(vPartitionSizesX)
        vPartitionSizesX = size(mtxImage, 2);
    end

    if nargin < 3 || isempty(vPartitionSizesY)
        vPartitionSizesY = size(mtxImage, 1);
    end

    assert(sum(vPartitionSizesX) == size(mtxImage, 2));
    assert(sum(vPartitionSizesY) == size(mtxImage, 1));

    vDividersX = row(cumsum(vPartitionSizesX));
    vDividersY = row(cumsum(vPartitionSizesY));

    vDividersX(end) = [];
    vDividersY(end) = [];

    for nDivider = vDividersX
        vline(nDivider + 0.5);
    end

    for nDivider = vDividersY
        hline(nDivider + 0.5);
    end
end
