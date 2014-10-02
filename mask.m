% USAGE:
%    arrMasked = mask(arrImage, mtxMask, <vColor>)
%
% DESCRIPTION:
%    Mask part of an image with a given color
%
% ARGUMENTS:
%    arrImage
%       The image to mask as a 3D array; see the "Tips" section of the
%       documentation of `image` for more information
%    mtxMask
%       A logical matrix; this should contain `false` where the image is to
%       be masked with color and `true` elsewhere.
%    vColor (default: [1, 1, 1])
%       The color to mask the image with as an RGB triple; defaults to white
function arrMasked = mask(arrImage, mtxMask, vColor)
    if nargin < 3
        vColor = [1, 1, 1];
    end

    % Argument checking
    assert(isvector(vColor) & length(vColor) == 3, ...
           'mask: the provided color must be a vector of length 3');
    assert(size(arrImage, 3) == 3, ...
           'mask: the provided image must be m-by-n-by-3 array');
    assert(isequal(size(arrImage), [size(mtxMask), 3]), ...
           'mask: the image and mask must have the same size');

    arrMasked = arrImage;

    mtxFalses = false(size(mtxMask));
    mtxNotMask = ~mtxMask;
    arrMasked(cat(3, mtxNotMask, mtxFalses, mtxFalses)) = vColor(1);
    arrMasked(cat(3, mtxFalses, mtxNotMask, mtxFalses)) = vColor(2);
    arrMasked(cat(3, mtxFalses, mtxFalses, mtxNotMask)) = vColor(3);
end
