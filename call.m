function cellOutput = call(fcn, nArgOut, varargin)
    cellOutput = apply(fcn, nArgOut, varargin);
end
