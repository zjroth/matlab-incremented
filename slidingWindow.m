%
% USAGE:
%
%    mtxWindows = slidingWindow(vMasterWindow, dWidth, dStep, bTruncate)
%
% DESCRIPTION:
%
%    Create a list of time windows of the given width within the given
%    master window.
%
% ARGUMENTS:
%
%    vMasterWindow
%
%       The window that we want to divide
%
%    dWidth
%
%       The width of the created windows
%
%    dStep
%
%       The amount by which the starting points of subsequent windows
%       will differ
%
% RETURNS:
%
%    mtxWindows
%
%       The list of windows as a 2-column matrix (where each row is a window).
%       Only windows that lie completely within the master window are returned.
%
function mtxWindows = slidingWindow(vMasterWindow, dWidth, dStep)
    dMasterWidth = diff(row(vMasterWindow));

    nWindows = ceil((dMasterWidth - dWidth) / dStep) + 1;
    mtxWindows = zeros(nWindows, 2);
    dStart = vMasterWindow(1);

    for i = 1 : nWindows
        mtxWindows(i, :) = [dStart, dStart + dWidth];
        dStart = dStart + dStep;
    end

    if mtxWindows(nWindows, 2) > vMasterWindow(2)
        mtxWindows(nWindows, :) = [];
    end
end
