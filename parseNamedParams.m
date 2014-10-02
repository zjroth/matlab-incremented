function parseNamedParams(cellParams, cellValidNames, varargin)
    % If a list of parameters wasn't specified, the list of parameters is
    % `varargin` from the workspace of the function that invoked this function.
    if nargin() < 1 || isempty(cellParams)
        cellParams = evalin('caller', 'varargin');
    end

    % By default, all parameter names are valid.
    if nargin() < 2 || isempty(cellValidNames)
        cellValidNames = {};
    end

    % Create a function to determine whether or not a name is in the allowed
    % list of names.
    function b = isAllowedName(name)
        if isempty(cellValidNames)
            b = true;
        elseif iscellstr(cellValidNames)
            b = any(strcmp(name, cellValidNames));
        else
            error(['parseNamedParams: list of valid names must be a cell ' ...
                   'array of strings']);
        end

        b = (b && isvarname(name));
    end

    % The number of named parameters represented by the parameter list.
    nParams = length(cellParams) / 2;
    cellNames = cellParams(1 : 2 : end - 1);
    cellValues = cellParams(2 : 2 : end);

    % Ensure that all supplied params are allowed.
    cellInvalidParams = cellNames(~cellfun(@isAllowedName, cellNames));
    callStack = dbstack();
    strCaller = callStack(2).name;
    assert(isempty(cellInvalidParams), ...
           [strCaller ': invalid parameter name(s): ' ...
            strjoin(row(cellInvalidParams), ', ')]);

    % If we've made it this far, then we want to assign the provided values
    % to the provided parameter names in the workspace of the function that
    % invoked this function.
    for i = 1 : nParams
        assignin('caller', cellNames{i}, cellValues{i});
    end
end
