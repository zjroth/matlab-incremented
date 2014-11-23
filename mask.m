% USAGE:
%    hdlMask = mask(mtxMask, <vColor>)
%
% DESCRIPTION:
%    Mask part of an image with a given color
%
% ARGUMENTS:
%    mtxMask
%       A logical matrix; this should contain `false` where the image is to
%       be masked with color and `true` elsewhere.
%    vColor (default: [1, 1, 1])
%       The color to mask the image with as an RGB triple; defaults to white
function hdlMask = mask(mtxMask, vColor)
    % Set the default mask color to be white.
    if nargin < 2
        vColor = [1, 1, 1];
    end

    % Argument checking
    assert(isvector(vColor) & length(vColor) == 3, ...
           'mask: the provided color must be a vector of length 3');

    % Ensure that the `hold` state of the axes stays fixed.
    bIsHolding = ishold(gca());

    % Plot the mask on top of whatever is there.
    hold('on');
    arrMask = reshape(repmat(row(vColor), numel(mtxMask), 1), ...
                      [size(mtxMask), 3]);
    hdlMask = image(arrMask);
    set(hdlMask, 'AlphaData', ~mtxMask);

    % Return the `hold` state.
    if ~bIsHolding
        hold('off');
    end
end
