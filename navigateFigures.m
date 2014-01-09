function navigateFigures(nTotalFigures, fcnPlot)
    fig = figure();

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
