% DESCRIPTION:
%    Apply a function to each cell of a cell array.
%
% NOTE:
%    This is basically just `cellfun` with 'UniformOutput' set to `false`.
%
% See also CELLFUN
function varargout = cellfcn(fcn, varargin)
    varargout = cell(1, max(1, nargout()));
    [varargout{:}] = cellfun(fcn, varargin{:}, 'UniformOutput', false);
end
