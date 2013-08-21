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
end;

if (nargin < 2 || isempty(mask))
    mask = ones(size(A));
end;

% mask infinite of NaN values as well
mask = mask.*isfinite(A);  % assumes thresh>0!
idx = find(mask>=thresh);  % colored values
widx = find(mask<thresh);  % white values

if (nargin < 6 || isempty(colors))
    colors = jet(64);
    % note that colors(40,:) = [1 1 0] is yellow
end;

if (nargin < 5 || isempty(clim))
    clim = [min(min(A(idx))) max(max(A(idx)))];
    if isempty(clim)
        clim = [0 1];
    end;
    if clim(2) == clim(1)
        clim(2) = clim(1)+1;
    end;
end;

if (nargin < 4 || isempty(fig))
    fig = 0;
end;

ncolors = size(colors,1);

% normalize matrix A -- clip to make sure all values b/w 0 and 1
normalA = (A - clim(1))/(clim(2)-clim(1));  
normalA(find(normalA<0))=0;
normalA(find(normalA>1))=1;
normalA(widx) = 0;

% colorA has color number (from 1 to ncolors) in each matrix entry
colorA = ceil(normalA*ncolors);    
idx0 = find(colorA == 0);
colorA(idx0) = 1;             % make sure lowest color index is 1


% make imagemtx(row,col,rgb)
sz = size(A);
for i = 1:sz(1)
    for j = 1:sz(2)
        imagemtx(i,j,:) = colors(colorA(i,j),:);
    end;
end;

% white out all values obtained below threshold of data points
for i = 0:2
    imagemtx(widx+i*sz(1)*sz(2)) = 1;
end;

% make colorbar
for i = 1:3
    cBar(:,:,i) = colors(:,i);
end;

if fig ~=0
    if fig ~= -1
        figure(fig);
        set(gcf,'DefaultAxesPosition', [0.05,0.04,.92,.90]);
    end;
    image(imagemtx);
    SideBar(cBar,clim);
end;