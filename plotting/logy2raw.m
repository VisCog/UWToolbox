function logy2raw(base,precision)
% logy2raw(base, precision)
%
% Converts Y-axis labels from log to raw values.
% 
% Inputs:
%   base           Base of log transform (default: e) 
%   precision      Number of decimal places (default: 2) 
%
% Example:
% x = linspace(-3,0,11);
% plot(log(x), log(x.^2));
% logx2raw();
% logy2raw(); % should be tolerant to multiple calls
%
% SEE ALSO:   logx2raw.m

% 11/17/96       gmb wrote it.
% 6/6/96	     gmb added precision argument
% 01/30/02       gmb updated it to use cell arrays, and to use original
%                xtick values instead of converting labels. This way,
%                multiple calls to this function doesn't keep converting
%                the axis.
% Edited by Kelly Chang - February 18, 2017


%% Input Control

if ~exist('base', 'var')
	base = exp(1);
end

if ~exist('precision', 'var')
	precision = 2;
end

%% Calculate Log x-axis Labels

precision = sprintf('%%%2.1ff', precision*1.1);
origYTick = get(gca, 'YTick'); % log y-axis labels (raw)
newYTick = base.^(origYTick); % convert to raw
newYLabel = arrayfun(@(x) sprintf(precision,x), newYTick, ...
    'UniformOutput', false); % write new y-axis labels
set(gca, 'YTickLabel', newYLabel);  % set y-axis labels of current graph