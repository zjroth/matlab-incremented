%
% USAGE:
%
%    cellOut = cellmap(fcnMap, <nArgOut>, cellIn1, ..., <cellInN>)
%
% DESCRIPTION:
%
%    Map the function across the given cell array and produce a cell array of
%    the output.
%
% ARGUMENTS:
%
%    fcnMap
%
%       The function (as a handle) to apply to the entries of the supplied cells
%
%    nArgOut (default: `abs(nargout(fcnMap))`)
%
%       The number of requested output values from each invocation of `fcnMap`.
%       To request all output values, try setting this to zero (though this
%       may not work depending how MATLAB handles `varargout`).
%
%    cellIn1, ..., <cellInN>
%
%       The input cell arrays whose cells the function should be applied to.
%       See `help cellfun` for more information.
%
% RETURNS:
%
%    cellOut
%
%       Each entry of this is a cell array containing the list of output values
%       for a single invocation of `fcnMap`.
%
function cellOut = cellmap(fcnMap, varargin)
    assert(~isempty(varargin), 'cellmap: no cell array provided');

    if ~isa(varargin{1}, 'cell')
        nArgOut = varargin{1};

        if nArgOut == 0
            nArgOut = nargout(fcnMap);
        end

        assert(isscalar(nArgOut) && isint(nArgOut), ...
               'cellmap: invalid number of requested output values `nArgOut`');
        cellInputCells = varargin(2:end);
    else
        nArgOut = nargout(fcnMap);
        cellInputCells = varargin;
    end

    assert(nArgOut ~= 0, 'cellmap: supplied function outputs no values');

    fcnApply = @(varargin) apply(fcnMap, abs(nArgOut), varargin);
    cellOut = cellfun(fcnApply, cellInputCells{:}, 'UniformOutput', false);
end
