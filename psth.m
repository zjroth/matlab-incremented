% vWindow: the time window (seconds) in which to return the PSTH
% vTimes: in seconds
% dStd: in seconds
% dRate: sample rate of the output
function [vPsth, vPsthTimes] = psth(vWindow, vFiringTimes, dStd, dRate)
    % Initialize the return variables.
    vPsthTimes = (vWindow(1) : (1 / dRate) : vWindow(2));
    nLength = length(vPsthTimes);

    % Convert the list of points to lists of indices.
    vIndices = ceil((vFiringTimes - vWindow(1)) * dRate);
    vIndices = clamp(vIndices, 1, nLength);

    % Represent the points in the return matrix.
    vPsth = accumarray(vIndices, 1, [nLength, 1]);

    % Smooth the resultant matrix with a gaussian window.
    nWidth = 2 * floor(round(6 * dStd * dRate) / 2) + 1;
    vWaveForm = row(gausswin(nWidth, 3));
    vPsth = conv(vPsth, vWaveForm, 'same');
end
