%
% USAGE:
%
%    cellFiles = findFiles(strDir, strRegexp)
%
% DESCRIPTION:
%
%    Find all of the files in the given directory that match the given regexp
%
% ARGUMENTS:
%
%    strDir
%
%       The directory to search
%
%    strRegexp
%
%       The regular expression to search for in file names
%
% RETURNS:
%
%    cellFiles
%
%       A cell array containing the names of the files that match the given
%       regular expression
%
function cellFiles = findFiles(strDir, strRegexp)
    % Get the directory listing.
    stctDirectory = dir(strDir);

    % Get the file names that match the given regular expression.
    vMatching = cellfun(@(x) ~isempty(regexp(x, strRegexp)), ...
                        {stctDirectory.name});

    % Retrieve the names, and return them as a cell array.
    cellFiles = {stctDirectory(vMatching).name};
end