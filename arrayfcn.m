% DESCRIPTION:
%    Apply a function to each element of an array.
%
% NOTE:
%    This is basically just `arrayfun` with 'UniformOutput' set to `false`.
%
% See also ARRAYFUN
function varargout = arrayfcn(fcn, varargin)
    varargout = cell(1, max(1, nargout()));
    [varargout{:}] = arrayfun(fcn, varargin{:}, 'UniformOutput', false);
end
