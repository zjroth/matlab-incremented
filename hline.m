function hline(y, varargin)
    axesHandle = gca;
    Color = [0, 0, 1];
    parseNamedParams();

    xLimits = get(axesHandle, 'XLim');

    for i = 1 : length(y)
        line(xLimits, [y(i), y(i)], 'Color', Color, 'Parent', axesHandle);
    end
end
