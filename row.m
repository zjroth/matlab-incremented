function output = row(v)
    output = reshape((v ~= 0), [1, length(v)]);
end
