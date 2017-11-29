function drawText(display, text, xy, color)
% drawText(display, text, xy, color)
%
% Calls the Psychtoolbox command Screen('DrawText') using a 'display'
% structure convention. Center aligns to the coordinates specified in 'xy'
%
% Inputs:
%   display
%   text
%   xy
%   color

% Written by Kelly Chang - February 23, 2017

%% Input Control

if ~exist('xy', 'var')
    xy = display.center;
end

if ~exist('color', 'var')
    color = [255 255 255]; % white
end

%% Adjust Text Alignment

tmp = Screen('TextBounds', display.window, text);
xy = xy - (tmp(3:4)/2);

%% Draw Text

Screen('DrawText', display.window, text, xy(1), xy(2), color);