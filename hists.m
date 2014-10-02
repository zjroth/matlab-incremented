% USAGE:
%    [nelements, centers] = hists(cellData, nBins)
%
% DESCRIPTION:
%    Create histograms with collections of data of different lengths.
%
% ARGUMENTS:
%    cellData
%       A cell array containing vectors of data points
%    nBins (default: 10)
%       The number of bins that the resultant histograms should contain
%    vWindow (default:
%       A 2-element vector of the form [min_val, max_val]; values outside of
%       this range will be placed into the outermost bins.
%    bNormalize
%       Specify that, instead of traditional bin counts, the bins will
%       contain proportions for their respective data sets.
%
% OUTPUT:
%    nelements
%       A matrix containing the counts (or proportions); a column corresponds to
%       the respective entry of `cellData`
%    centers
%       A vector containing the centers of the bins of the histogram
%
% NOTE:
%    If `cellData` were a row whose entries were column vectors of a fixed
%    length, this would be roughly equivalent to `hist(cell2mat(cellData),
%    nBins)`.
function [nelements, centers] = hists(cellData, nBins, vWindow, bNormalize)
    %parseNamedParams({'nBins', 'vWindow', 'bNormalize'});

    if nargin < 2 || isempty(nBins)
        nBins = 10;
    end

    % Set the maximum and minimum values for the data.
    if nargin < 3 || isempty(vWindow)
        dMax = max(cellfun(@max, cellData));
        dMin = min(cellfun(@min, cellData));
    else
        dMin = vWindow(1);
        dMax = vWindow(2);
    end

    % By default, do not normalize.
    if nargin < 4
        bNormalize = false;
    end

    % Set the endpoints for the bins and the centers of the bins.
    dBinwidth = (dMax - dMin) ./ nBins;

    vEndpoints = (dMin + eps) + dBinwidth * (0 : nBins);
    vEndpoints(1) = -Inf;
    vEndpoints(end) = Inf;

    vCenters = (dMin + dBinwidth / 2) + dBinwidth * (0 : nBins - 1);

    % Retrieve the histogram counts.
    cellCounts = cellfun(@(v) col(histc(v, vEndpoints)), cellData, ...
                         'UniformOutput', false);
    mtxCounts = cell2mat(row(cellCounts));
    mtxCounts = mtxCounts(1 : end - 1, :);

    if bNormalize
        mtxCounts = bsxfun(@rdivide, mtxCounts, sum(mtxCounts, 1));
    end

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
