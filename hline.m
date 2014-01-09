function hline(y, varargin)
    axesHandle = gca;
    Color = [0, 0, 1];
    parseNamedParams();

    vHorizontalBounds = get(axesHandle, 'XLim');

    for i = 1 : length(y)
        line(vHorizontalBounds, [y(i), y(i)], 'Color', Color, 'Parent', axesHandle);
    end
end
