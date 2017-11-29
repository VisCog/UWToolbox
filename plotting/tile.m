function tile(m, n, monitor)
% tile(m, n,  monitor)
%
% Tiles matlab figures in the monitor in rows starting at the top-left.
%
% Inputs:
%   m         Number of rows of figures 
%   n         Number of columns (default: Matches aspect ratio of monitor)
%   monitor   Monitor number, 1 is desktop, 2+ is extended. (default: 
%             highest available monitor number)
%
% Example:
% close all;
% for i = 1:12
%    figure(i);
%    set(gcf, 'MenuBar', 'none', 'Color', 'k');
%    text(0, 0, num2str(i), 'FontSize', 64, 'HorizontalAlignment', 'Center', 'Color', 'g');
%    set(gca, 'XLim', [-1 1], 'YLim', [-1 1]);
%    axis off;
%  end
%  tile(3,4);
 
% Written 3/30/12 GMB (after getting frustrated by Matlab's positioning of
% figures outside the monitor by default)
% Edited by Kelly Chang - February 18, 2017

%% Input Control

if ~exist('m', 'var');
    m = [];
end

if ~exist('n', 'var');
    n = [];
end

monitorPos = get(0, 'MonitorPositions');
nMonitors = size(monitorPos, 1); % number of monitors
if ~exist('monitor', 'var')
    monitor = nMonitors;
end

if monitor > nMonitors
    error('No monitor #%d available', monitor);
end

%% Get Figures

figs = get(0,'Children');
figNum = [figs.Number];
[~,id] = sort(figNum);

%% Calculate dx and dy for Figures

sz = monitorPos(monitor,[3 4]); % [x y] of monitor
if ispc() && monitor == 1 % windows, adjust for menu bar at bottom
    sz(2) = sz(2)-50; 
end

if isempty(m)
    m = ceil(sqrt(length(figs)*sz(2)/sz(1)));
end

if isempty(n)
    n = ceil(length(figs)/m);
end

if ~((m*n) >= length(figs))
    error('No enough tiles given the number of figures');
end

dx = round((sz(1))/n);
dy = round((sz(2))/m);

%% Tile Figures

x = 1:dx:(sz(1)+1);
y = 1:dy:(sz(2)+1);
xy = CombVec(x(1:n), fliplr(y(1:m)), dx, dy)';
xy = xy(1:length(figs),:);
for i = 1:length(figs)
    set(figs(id(i)), 'Units', 'Pixels', 'OuterPosition', xy(i,:));
end