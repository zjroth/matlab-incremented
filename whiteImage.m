function [imagemtx,cBar,clim] = whiteImage(A,mask,thresh,fig,clim,colors);
    % function [imagemtx,cBar,clim] = whiteImage(A,mask,thresh,fig,clim,colors);
    %
    % A = matrix whose image you want to code in color
    % fig = figure in which to plot image (optional)
    % fig = 0 is default, and means no plot is made
    % fig = -1 plots w/o starting a new figure (allows to use as subplot)
    %
    % mask = matrix of same size as A, with values which determine whether
    %     entries of A are colored or masked (made white)
    % thresh = threshold below which A entries are masked
    %     i.e. if mask(i,j) < thresh, then A(i,j) will be white
    % clim = color limits (clip colors beyond these values)
    % colors = colormap (default is matlab default: jet(64))
    %     number of rows = number of colors, columns are rgb values
    % imagemtx = 3-d matrix of rgb values for each entry of A
    % cBar = corresponding colorbar (use SideBar(cBar) in figure)
    %
    % plot result via: image(imagemtx); SideBar(cBar);

    if (nargin < 3 || isempty(thresh))
        thresh = 0;
    end

    if (nargin < 2 || isempty(mask))
        mask = ones(size(A));
    end

    % mask infinite of NaN values as well
    mask = mask .* isfinite(A);  % assumes thresh > 0!
    idx = (mask >= thresh);  % colored values
    widx = (mask < thresh);  % white values

    if (nargin < 6 || isempty(colors))
        colors = jet(64);
        % note that colors(40,:) = [1 1 0] is yellow
    end

    if (nargin < 5 || isempty(clim))
        clim = [min(min(A(idx))), max(max(A(idx)))];

        if isempty(clim)
            clim = [0, 1];
        elseif clim(2) == clim(1)
            clim(2) = clim(1) + 1;
        end
    end

    if (nargin < 4 || isempty(fig))
        fig = 0;
    end

    ncolors = size(colors, 1);

    % normalize matrix A -- clip to make sure all values b/w 0 and 1
    normalA = (A - clim(1)) / diff(clim);
    normalA(normalA < 0) = 0;
    normalA(normalA > 1) = 1;
    normalA(widx) = 0;

    % colorA has color number (from 1 to ncolors) in each matrix entry
    colorA = ceil(normalA * ncolors);
    colorA(colorA == 0) = 1;             % make sure lowest color index is 1

    % make imagemtx(row,col,rgb)
    imagemtx = reshape(colors(colorA, :), [size(A), 3]);

    % white out all values obtained below threshold of data points
    imagemtx(repmat(widx, [1, 1, 3])) = 1;

    % make colorbar
    for i = 1:3
        cBar(:,:,i) = colors(:,i);
    end

    if fig ~=0
        if fig ~= -1
            figure(fig);
            set(gcf, 'DefaultAxesPosition', [0.05,0.04,.92,.90]);
        end

        image(imagemtx);
        sideBar(cBar,clim);
    end
end

% function ax = sideBar(cBar,zlim,h);
function ax = sideBar(cBar,zlim,h);
    % set values for which plot to add SideBar to (default: gca)
    if nargin < 3;
        h = gca;
        hfig = gcf;
    else
        hfig = get(h,'parent');
    end;

    if nargin < 2;
        zlim = [0 1];
    end;

    % legend('RestoreSize',h);  % restore axes to pre-legend size
    units = get(h,'units');
    set(h,'units','normalized');
    pos = get(h,'Position');
    stripe = 0.075;
    edge = 0.02;
    space = 0.05;
    set(h,'Position',[pos(1) pos(2) pos(3)*(1-stripe-edge-space) pos(4)]);
    % legend('RecordSize',h);  %set this as the new legend fullsize

    rect = [pos(1)+(1-stripe-edge)*pos(3) pos(2) stripe*pos(3) pos(4)];
    ax = axes('position',rect);
    set(h,'units',units);

    axes(ax);

    % most annoying bit is colorbar
    image(0,zlim(1)+(0:.01:1)*(zlim(2)-zlim(1)), cBar);
    set(gca, 'ydir', 'normal');
    set(gca, 'xtick', []);
    set(gca, 'yaxislocation', 'right');
    axes(h);
end
