% USAGE:
%    vFilter = gaussfilt(nWidth, <dNumStd>)
%
% DESCRIPTION:
%    Return a Gaussian filter; this is just a Gaussian window that has been
%    normalized.
%
% ARGUMENTS:
%    nWidth
%       The total width of (i.e., number of indices in) the returned filter
%    dNumStd (default: 2.5)
%       The number of standard deviations to fit into the returned filter; this
%       is the same as the `alpha` parameter from the function `gausswin`
%
% RETURN:
%    vFilter
%       The desired filter
function vFilter = gaussfilt(nWidth, dNumStd)
    if nargin < 2
        dNumStd = 2.5;
    end

    vFilter = gausswin(nWidth, dNumStd);
    vFilter = vFilter / sum(vFilter);
end