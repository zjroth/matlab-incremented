function vline(x, varargin)
    axesHandle = gca;
    color = [0, 0, 1];
    parseNamedParams();

    yLimits = get(axesHandle, 'YLim');
    line([x, x], yLimits, 'Color', color, 'Parent', axesHandle);
end
