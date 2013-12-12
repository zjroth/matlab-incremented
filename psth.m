% vWindow: the time window (seconds) in which to return the PSTH
% vTimes: in seconds
% dStd: in seconds
% dRate: sample rate of the output
function [vPsth, vPsthTimes] = psth(vWindow, vFiringTimes, dStd, dRate)
    % Initialize the gaussian window.
    nWidth = 2 * floor(round(6 * dStd * dRate) / 2) + 1;
    nArmWidth = (nWidth - 1) / 2;
    vWaveForm = row(gaussfilt(nWidth, 3));

    % Find where the firings occur in the returned wave.
    vPsthTimes = (vWindow(1) : (1 / dRate) : vWindow(2));
    vFiringIndices = round((vFiringTimes - vWindow(1)) * dRate);

    % Initialize the return data.
    vPsth = zeros(size(vPsthTimes));

    %
    vGaussianIndices = (-nArmWidth : nArmWidth);
    nMaxWindowIndex = length(vPsthTimes);

    for i = 1 : length(vFiringIndices)
        vPsthIndices = vFiringIndices(i) + vGaussianIndices;
        vToKeep = (vPsthIndices >= 1 & vPsthIndices <= nMaxWindowIndex);
        vPsthIndices = vPsthIndices(vToKeep);
        vPsth(vPsthIndices) = vPsth(vPsthIndices) + vWaveForm(vToKeep);
    end
end
