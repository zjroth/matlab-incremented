function parseNamedParams(validNames)
    % Our list of parameters is `varargin` from the workspace of the
    % function that invoked this function.
    paramList = evalin('caller', 'varargin');

    % The number of named parameters represented by the parameter list.
    nParams = length(paramList) / 2;

    % By default, we will assume that all parameter names are valid.
    if nargin() == 0
        validNames = 'all';
    end

    % Create a function to determine whether or not a name is in the allowed
    % list of names.
    function valid = isAllowedName(name)
        if iscell(validNames)
            valid = any(strcmp(name, validNames));
        elseif ischar(validNames)
            valid = strcmp(validNames, 'all');
        else
            valid = false;
        end
    end

    % Loop through the named parameters.
    for i = 1 : nParams
        % Retrieve the name of the current parameter and its value.
        idx = 2 * i - 1;
        name = paramList{idx};
        val = paramList{idx + 1};

        % Complain if the parameter name is not a valid matlab variable
        % name.
        if isvarname(name)
            % Complain if the parameter name is not allowed by the caller
            % function.
            if isAllowedName(name)
                % If we've made it this far, then we want to assign the
                % provided value for the parameter name in the workspace
                % of the function that invoked this function.
                assignin('caller', name, val);
            else
                error(['parseNamedParams: invalid named parameter: ' name]);
            end
        else
            error(['parseNamedParams: invalid parameter name: ' name]);
        end
    end
end