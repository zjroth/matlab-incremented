% USAGE:
%    uknVar = loadvar(strFile, strVar)
%
% DESCRIPTION:
%    Retrieve a variable from a .mat file
%
% ARGUMENTS:
%    strFile
%       The file containing the variable
%    strVar
%       The variable name to retrieve
function uknVar = loadvar(strFile, strVar)
    uknVar = getfield(load(strFile, strVar), strVar);
end
