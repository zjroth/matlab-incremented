function filter = gaussfilt(width, alpha)
    if nargin < 2
        alpha = 2.5;
    end

    filter = gausswin(width, alpha);
    filter = filter / sum(filter);
end