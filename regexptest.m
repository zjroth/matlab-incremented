% USAGE:
%    bMatches = regexptest(str, rgx)
%
% DESCRIPTION:
%    Determine whether a string matches a regular expression anywhere.
%
% ARGUMENTS:
%    str
%       A string
%    rgx
%       A regular expression; see `help regexp` for more information.
%
% RETURNS:
%    bMatches
%       A boolean telling whether there is a string/regexp match
function bMatches = regexptest(str, rgx)
    bMatches = ~isempty(regexp(str, rgx, 'once'));
end
