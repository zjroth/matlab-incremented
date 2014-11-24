% USAGE:
%    vMinMax = minmax(x)
%
% DESCRIPTION:
%    Find the minimum and maximum values of an array.
%
% RETURNS:
%    vMinMax
%       The vector [min(x(:)), max(x(:))]
function vMinMax = minmax(x, varargin)
    m = min(x, varargin{:});
    M = max(x, varargin{:});

    vMinMax = [m, M];
end
