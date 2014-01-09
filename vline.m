function vline(x, varargin)
    axesHandle = gca;
    Color = [0, 0, 1];
    parseNamedParams();

    vVerticalBounds = get(axesHandle, 'YLim');

    for i = 1 : length(x)
        line([x(i), x(i)], vVerticalBounds, 'Color', Color, 'Parent', axesHandle);
    end
end
