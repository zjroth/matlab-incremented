% vShuffled = shuffle(vIn)
function vShuffled = shuffle(vIn)
    vPerm = randperm(length(vIn));
    vShuffled = vIn(vPerm);
end