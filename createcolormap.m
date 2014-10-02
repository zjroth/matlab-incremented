% USAGE:
%    mtxMap = createcolormap(uknColors, nMapSize)
%
% DESCRIPTION:
%    Create a new color map from the provided list of colors
%
% ARGUMENTS:
%    uknColors
%       The list of colors, either a 3-column matrix or a cell array of fixed
%       colors (e.g., `'r'`) and/or vectors of length 3.
%    nMapSize (default: 64)
%       The size of the resultant map
%
% RETURNS:
%    mtxMap
%       The newly-created colormap (a 3-column matrix)
function mtxMap = createcolormap(uknColors, nMapSize)
    if nargin < 2
        nMapSize = 64;
    end
    
    mtxColors = toColorMatrix(uknColors);
    nColors = size(mtxColors, 1);
    mtxMap = zeros(nMapSize, 3);

    vLowColorIndex = floor(linspace(1, nColors, nMapSize));
    vLowWeight = 1 - col(mod(linspace(1, nColors, nMapSize), 1));
    vLowColorIndex(end) = nColors - 1;
    vLowWeight(end) = 0;

    mtxMapLow = mtxColors(vLowColorIndex, :);
    mtxMapHigh = mtxColors(vLowColorIndex + 1, :);
    mtxMap = bsxfun(@times, vLowWeight, mtxMapLow) + ...
             bsxfun(@times, (1 - vLowWeight), mtxMapHigh);
end

function mtxColors = toColorMatrix(uknColors)
    if ~iscell(uknColors)
        mtxColors = uknColors;
    else
        cellColors = uknColors;
        nColors = length(cellColors);
        mtxColors = zeros(nColors, 3);

        for i = 1 : nColors
            uknColor = cellColors{i};

            if isa(uknColor, 'char')
                vColor = charToColor(uknColor);
            else
                vColor = row(uknColor);
                assert(length(vColor) == 3, ...
                       ['cmap: unrecognized color ' num2str(uknColor)]);
            end

            mtxColors(i, :) = vColor;
        end
    end
end

% A map from the built-in color identifiers to their corresponding RGB vectors.
function vColor = charToColor(strChar)
    switch strChar
      case 'y'
          vColor = [1 1 0];
      case 'm'
        vColor = [1 0 1];
      case 'c'
        vColor = [0 1 1];
      case 'r'
        vColor = [1 0 0];
      case 'g'
        vColor = [0 1 0];
      case 'b'
        vColor = [0 0 1];
      case 'w'
        vColor = [1 1 1];
      case 'k'
        vColor = [0 0 0];
      otherwise
        error(['cmap: unrecognized color ' strChar]);
    end
end

function mtxColors = cmap_transition(vLow, vHigh, nMapSize)
    vPerc = col(linspace(0, 1, nMapSize));

    mtxColors = bsxfun(@times, 1 - vPerc, row(vLow)) + ...
        bsxfun(@times, vPerc, row(vHigh));
end
