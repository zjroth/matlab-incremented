function vline(x, varargin)
    axesHandle = gca;
    Color = [0, 0, 1];
    parseNamedParams();

    yLimits = get(axesHandle, 'YLim');

    for i = 1 : length(y)
        line([x(i), x(i)], yLimits, 'Color', Color, 'Parent', axesHandle);
    end
end
