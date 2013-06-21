function vline(axesHandle, x, color)
  yLimits = get(axesHandle, 'YLim');
  line([x, x], yLimits, 'Color', color);
end
