% USAGE:
%    vline(x, varargin)
%
% DESCRIPTION:
%    Create vertical lines on the current axes
%
% ARGUMENTS:
%    x
%       A vector of x-values to plot lines at
%    varargin
%       Any additional arguments beyond `x` are passed directly into `line`.
function vline(x, varargin)
    axesHandle = gca;
    Color = [0, 0, 1];
    parseNamedParams();

    vVerticalBounds = get(axesHandle, 'YLim');

    for i = 1 : length(x)
        line([x(i), x(i)], vVerticalBounds, varargin{:});
    end
end
