function stctOut = structmapleaves(fcnMap, stctIn)
    stctOut = stctIn;

    if isa(stctIn, 'struct')
        cellFields = fieldnames(stctOut);

        for i = 1 : length(cellFields)
            strField = cellFields{i};
            stctOut.(strField) = structmapleaves(fcnMap, stctOut.(strField));
        end
    else
        stctOut = fcnMap(stctIn);
    end
end
