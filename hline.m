% USAGE:
%    hline(y, varargin)
%
% DESCRIPTION:
%    Create horizontal lines on the current axes
%
% ARGUMENTS:
%    y
%       A vector of y-values to plot lines at
%    varargin
%       Any additional arguments beyond `y` are passed directly into `line`.
function hline(y, varargin)
    axesHandle = gca;
    Color = [0, 0, 1];
    parseNamedParams();

    vHorizontalBounds = get(axesHandle, 'XLim');

    for i = 1 : length(y)
        line(vHorizontalBounds, [y(i), y(i)], varargin{:});
    end
end
