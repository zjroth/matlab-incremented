% USAGE:
%    [mtxMasked, vColorLimits] = masksc(mtxImage, mtxMask, vColor, ...
%                                       vColorLimits, mtxColorMap)
%
% DESCRIPTION:
%    Mask an image; similar to `imagesc`
%
% ARGUMENTS:
%    mtxImage
%       The image to mask as a matrix
%    mtxMask
%       A logical matrix; this should contain `false` where the image is to
%       be masked with color and `true` elsewhere.
%    vColor (default: [1, 1, 1])
%       The color to mask the image with as an RGB triple; defaults to white
%    vColorLimits (default: max and min in displayed part of `mtxImage`)
%       A vector of length 2; the minimum and maximum values of the color map
%    mtxColorMap (default: `jet(64)`)
%       A 3-column matrix containing RGB triples
function [mtxMasked, vColorLimits] = masksc(mtxImage, mtxMask, vColor, ...
                                            vColorLimits, mtxColorMap)
    % Argument checking
    assert(isequal(size(mtxImage), size(mtxMask)), ...
           'masksc: the image and mask must have the same size');

    if nargin < 4 || isempty(vColorLimits)
        vMaskedVals = mtxImage(mtxMask);
        vColorLimits = [min(vMaskedVals), max(vMaskedVals)];
    end

    if nargin < 5
        mtxColorMap = jet(64);
    end

    % Clamp the image to the given range.
    mtxClamped = (mtxImage - vColorLimits(1)) / diff(vColorLimits);
    mtxClamped(mtxClamped < 0) = 0;
    mtxClamped(mtxClamped >= 1) = 1 - eps;

    % Map the clamped values to row indices of the color map, and then build
    % the image from that information.
    mtxColorIndices = floor(mtxClamped * size(mtxColorMap, 1)) + 1;
    arrImage = reshape(mtxColorMap(mtxColorIndices(:), :), [size(mtxImage), 3]);

    % Now simply mask the image array.
    if nargin < 3 || isempty(vColor);
        mtxMasked = mask(arrImage, mtxMask);
    else
        mtxMasked = mask(arrImage, mtxMask, vColor);
    end

    % Plot it.
    image(mtxMasked, 'CDataMapping', 'scaled');
    caxis(vColorLimits);
    colorbar();
end
