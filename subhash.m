function hashSub = subhash(hashIn, cellKeepKeys)
    assert(isa(hashIn, 'containers.Map'), ...
           'subhash: input must be of type "containers.Map"');

    cellKeys = keys(hashIn);
    cellValues = values(hashIn);
    vKeep = ismember(cellKeys, cellKeepKeys);

    hashSub = containers.Map(cellKeys(vKeep), cellValues(vKeep));
end
