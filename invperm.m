% vInverse = invperm(vPerm)
function vInverse = invperm(vPerm)
    nLength = length(vPerm);
    vInverse = zeros(size(vPerm));
    bIsValid = true;

    for i = 1 : nLength
        k = vPerm(i);

        % The input is not a valid permutation if any entry is outside of the
        % interval [1, nLength] or if any entry is duplicated.
        if (k < 1) || (k > nLength) || (vInverse(k) ~= 0)
            % In this case, set a flag and break out of the loop.
            bIsValid = false;
            break;
        end

        vInverse(k) = i;
    end

    assert(bIsValid, 'invperm: input is not a valid permutation');
end