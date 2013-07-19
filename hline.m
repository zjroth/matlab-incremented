function hline(y, varargin)
    axesHandle = gca;
    color = [0, 0, 1];
    parseNamedParams();

    xLimits = get(axesHandle, 'XLim');
    line(xLimits, [y, y], 'Color', color, 'Parent', axesHandle);
end
