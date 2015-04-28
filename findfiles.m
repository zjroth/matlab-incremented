% USAGE:
%    cellFiles = findfiles(strDir, strRegexp)
%
% DESCRIPTION:
%    Find all of the files in the given directory that match the given regexp
%
% ARGUMENTS:
%    strDir
%       The directory to search
%    strRegexp
%       The regular expression to search for in file names
%
% RETURNS:
%    cellFiles
%       A cell array containing the names of the files that match the given
%       regular expression
function cellFiles = findfiles(strDir, strRegexp)
    % Default to matching all files...
    if nargin < 2
        strRegexp = '.*';
    end

    % ...in the current directory.
    if nargin < 1
        strDir = '.';
    end

    % Get the directory listing.
    stctDirectory = dir(strDir);

    % Keep only those file names that match the given regular expression.
    fcnMatches = @(s) regexptest(s, strRegexp);
    cellFiles = keep(fcnMatches, {stctDirectory.name});
end