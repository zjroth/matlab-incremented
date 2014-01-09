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
        hdlFigure = gca();
    end

    [~, ~, strFileType] = fileparts(strFilename);

    switch strFileType
      case '.bmp'
        print('-dbmp16m', strFilename);
      case '.eps'
        print('-depsc', strFilename);
      case {'.jpg', '.jpeg'}
        print('-djpeg', strFilename);
      case '.pdf'
        print('-dpdf', strFilename);
      case '.png'
        print('-dpng', strFilename);
      otherwise
        error(['savefigure: unrecognized file type "' strFileType '"']);
    end
end
