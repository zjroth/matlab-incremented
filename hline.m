function hline(axesHandle, y, color)
  xLimits = get(axesHandle, 'XLim');
  line(xLimits, [y, y], 'Color', color);
end
