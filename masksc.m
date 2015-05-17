% USAGE:
%    h = masksc(mtxImage, mtxMask, vColor)
%
% DESCRIPTION:
%    Similar to `imagesc` followed by `mask`. Also, reset the color scale
%    based on the non-masked values.
%
% ARGUMENTS:
%    mtxImage
%       The image to mask as a matrix
%    mtxMask
%       A logical matrix; this should contain `false` where the image is to
%       be masked with color and `true` elsewhere.
%    vColor (default: [1, 1, 1])
%       The color to mask the image with as an RGB triple; defaults to white
function [hdlImage, hdlMask] = masksc(mtxImage, mtxMask, vColor)
    % Ensure that the image and mask are the same size. This is a somewhat
    % artificial requirement since the code will run without this check.
    assert(isequal(size(mtxImage), size(mtxMask)), ...
           'masksc: the image and mask must have the same dimensions');

    if nargin < 3
        vColor = [1, 1, 1];
    end

    % Plot the image using `imagesc`, then make the masked parts transparent.
    hdlImage = imagesc(mtxImage);

    % Mask the image.
    hdlMask = mask(mtxMask, vColor);

    % The plot limits get offset when we show the background (i.e., the mask
    % color). Set the correct limits here.
    xlim([0.5, size(mtxImage, 2) + 0.5])
    ylim([0.5, size(mtxImage, 1) + 0.5])

    % Reset the color limits.
    vShownValues = mtxImage(mtxMask);

    if ~isempty(vShownValues)
        clim(minmax(vShownValues));
    end
end
