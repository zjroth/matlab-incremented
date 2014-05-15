% USAGE:
%    savefigure(strFilename, <hdlFigure>)
%
% DESCRIPTION:
%    Save a figure as an image file. For more advanced saving options, use the
%    Matlab function `print`.
%
% PARAMETERS:
%    strFilename
%       The file to save to; this can be relative or full but must include an
%       appropriate extension. Current supported extensions are bmp, eps, jpg,
%       jpeg, pdf, and png.
%
%    hdlFigure (default: `gca()`)
%       A handle to the figure to be saved
function savefigure(strFilename, hdlFigure)
    set(gcf,'PaperPositionMode','auto');

    if nargin < 2
        hdlFigure = gcf();
    end

    [~, ~, strFileType] = fileparts(strFilename);

    switch strFileType
      case '.bmp'
        print(hdlFigure, '-dbmp16m', strFilename);
      case '.eps'
        print(hdlFigure, '-depsc', strFilename);
      case {'.jpg', '.jpeg'}
        print(hdlFigure, '-djpeg', strFilename);
      case '.pdf'
        % For some reason, matlab will not get the figure dimensions
        % correct when saving a figure as a PDF. Here, we account for that
        % by manually setting the paper size.
        strUnits = get(hdlFigure, 'Units');
        set(hdlFigure, 'Units', get(hdlFigure, 'PaperUnits'));
        vPosition = get(hdlFigure, 'Position');
        set(hdlFigure, 'PaperSize', vPosition([3, 4]));

        % Save the figure as in the other cases.
        print(hdlFigure, '-dpdf', strFilename);

        % Now that we have saved the figure, return the figure units to
        % their original value.
        set(hdlFigure, 'Units', strUnits);
      case '.png'
        print(hdlFigure, '-dpng', strFilename);
      otherwise
        error(['savefigure: unrecognized file type "' strFileType '"']);
    end
end
