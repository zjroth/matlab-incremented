function cellOutput = apply(fcn, nArgOut, cellArgs)
    cellOutput = cell(1, nArgOut);
    [cellOutput{:}] = fcn(cellArgs{:});
end
