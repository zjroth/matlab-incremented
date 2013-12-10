function stctOut = structmap(fcnMap, stctIn)
    stctOut = stctIn;

    for i = 1 : length(cellFields)
        strField = cellFields{i};
        stctOut.(strField) = fcnMap(stctOut.(strField));
    end
end
