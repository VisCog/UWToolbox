function [h] = subp(m, n, p, spacing)
% h = subp(m, n, p, spacing)
%
% Breaks the Figure window into an m-by-n matrix of small axes, selects the
% p-th axes for the current plot with spacing padding around the axes, and
% returns the axes handle. The axes are counted along the top row of the
% Figure window, then the second row, etc.
%
% Inputs: 
%   m             Number of rows to break the Figure window (default: 1)
%   n             Number of columns to break the Figure window (default: 1)
%   p             The axes number within the the Figure window (default: 1)
%   spacing       Padding around the called axes, numeric (default: 0.08)
%
% Output:
%   h             Returns the axis handle of the called subplot

% Written by G.M. Boynton 
% Edited by Kelly Chang - March 15, 2017

%% Input Contol

if ~exist('m', 'var');
    m = 1;
end

if ~exist('n', 'var');
    n = 1;
end

if ~exist('p', 'var');
    p = 1;
end

if ~exist('spacing', 'var');
    spacing = 0.08;
end

if p > (m*n)
    error('Subaxes index outside valid range (nCols x nRows)');
end

%% Calculate Subplot Axis Position

xSize = (1/n) - spacing;
ySize = (1/m) - spacing;

xStart = (spacing/2) + (1/n) * rem(p-1,n);
yStart = 1 + (spacing/2) - (1/m) - (1/m) * floor((p-1)/n);

axPos = [xStart yStart xSize ySize];

%% Output Figure Handle

if nargout > 0 % if output
    h = axes('pos', axPos);
else
    axes('pos', axPos);
end