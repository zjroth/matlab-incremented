function vScore = zscore(vInput)
    assert(isvector(vInput), 'zscore: input must be a vector');
    vScore = (vInput - mean(vInput)) ./ std(vInput);
end