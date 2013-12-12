% vTimes: in seconds
% dStd: in seconds
% dRate: sample rate of the output
function tsPsth = psth(vFiringTimes, dStd, dRate)
    % Initialize the gaussian window.
    nWidth = 2 * floor(round(6 * dStd * dRate) / 2) + 1;
    nArmWidth = (nWidth - 1) / 2;
    vWaveForm = gaussfilt(nWidth, 3);

    % Find where the firings occur in the returned wave.
    vFiringIndices = round(vFiringTimes * dRate);
    vWaveTimes = (min(vFiringIndices) - nArmWidth : max(vFiringIndices) + nArmWidth) ./ dRate;
    vFiringIndices = vFiringIndices - (min(vFiringIndices) - 1 - nArmWidth);

    % Initialize the return data.
    vPsth = zeros(max(vFiringIndices) + nArmWidth, 1);

    %
    vWindow = (-nArmWidth : nArmWidth);

    for i = 1 : length(vFiringIndices)
        vPsthIndices = vFiringIndices(i) + vWindow;
        vPsth(vPsthIndices) = vPsth(vPsthIndices) + vWaveForm;
    end

    tsPsth = TimeSeries(vPsth, vWaveTimes);
end
