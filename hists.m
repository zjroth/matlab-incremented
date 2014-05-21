% USAGE:
%    [nelements, centers] = hists(cellData, nBins)
%
% DESCRIPTION:
%    Create histograms with collections of data of different lengths.
%
% ARGUMENTS:
%    cellData
%       A cell array containing vectors of data points
%    nBins
%       The number of bins that the resultant histograms should contain
%
% OUTPUT:
%    nelements
%       A matrix containing the counts; a column corresponds to the respective
%       entry of `cellData`
%    centers
%       A vector containing the centers of the bins of the histogram
%
% NOTE:
%    If `cellData` were a row whose entries were column vectors of a fixed
%    length, this would be roughly equivalent to `hist(cell2mat(cellData),
%    nBins)`.
function [nelements, centers] = hists(cellData, nBins)
    if nargin < 2
        nBins = 10;
    end

    % Set the endpoints for the bins.
    dMax = max(cellfun(@max, cellData));
    dMin = min(cellfun(@min, cellData));

    dBinwidth = (dMax - dMin) ./ nBins;

    vEndpoints = (dMin + eps) + dBinwidth * (0 : nBins);
    vEndpoints(1) = dMin;

    vCenters = (dMin + dBinwidth / 2) + dBinwidth * (0 : nBins - 1);

    % Retrieve the histogram counts.
    cellCounts = cellfun(@(v) col(histc(v, vEndpoints)), cellData, ...
                         'UniformOutput', false);
    mtxCounts = cell2mat(row(cellCounts));
    mtxCounts = mtxCounts(1 : end - 1, :);

    % Plot the results or return requested output.
    if nargout == 0
        bar(vCenters, mtxCounts, 'hist');
    else
        nelements = mtxCounts;

        if nargout > 1
            centers = vCenters;
        end
    end
end
