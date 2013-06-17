function output = col(v)
    output = reshape((v ~= 0), [length(v), 1]);
end
