% vInverse = invperm(vPerm)
function vInverse = invperm(vPerm)
    vInverse = zeros(size(vPerm));

    for i = 1 : length(vPerm)
        vInverse(vPerm(i)) = i;
    end
end