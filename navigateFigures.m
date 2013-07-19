function navigateFigures(nTotalFigures, fcnPlot)
    fig = figure();

    screenSize = get(0, 'ScreenSize');
    set(fig, 'Position', [0 0 screenSize(3) screenSize(4)]);

    set(fig, 'KeyReleaseFcn', @handleKeyPress);

    nCurrFigure = 1;
    fcnPlot(nCurrFigure);

    function handleKeyPress(hObject, eventdata)
        if strcmp(eventdata.Key, 'rightarrow') || strcmp(eventdata.Key, 'space')
            nCurrFigure = min(nCurrFigure + 1, nTotalFigures);
            fcnPlot(nCurrFigure);
        elseif strcmp(eventdata.Key, 'leftarrow') || strcmp(eventdata.Key, 'backspace')
            nCurrFigure = max(nCurrFigure - 1, 1);
            fcnPlot(nCurrFigure);
        end
    end
end
