function [display] = OpenWindow(display)
% [display] = OpenWindow(display)
%
% Calls the Psychtoolbox command Screen('OpenWindow') using a 'display'
% structure convention.
%
% Input:
%   display             A structure containing display information with 
%                       fields, optional:
%       screen          Screen Number (default: 0)
% 
%       resolution      A vector of screen [width height] to be opened in
%                       pixels (default: full screen)
% 
%       bkColor         Background color (default: [0 0 0] black)
% 
%       skipChecks      Flag for skipping screen synchronization, logical.
%                       When set to true Screen('Preference') is set to: 
%                           'Verbosity' level is 0  
%                           'SkipSyncTests' is true
%                           'VisualDebugLevel' level is 0
%                           'SuppressAllWarnings' is true
%                       (default: true, skip checks)
%
% Output:
%   display             Same structure as passed in, but with additional 
%                       fields filled in:
%       windowPtr       Pointer to window, as returned by
%                       Screen('OpenWindow'), numeric
% 
%       frameRate       Frame rate in Hz, as determined by 
%                       Screen('GetFlipInterval'), numeric
% 
%       resolution      A vector of screen [xLeft yUp xRight yBottom] in 
%                       pixels
% 
%       center          A vector of the screen [x y] center in pixels 
%
% Notes: 
% - For full functionality, the additional fields of 'display' should be
%   filled in when calling OpenWindow:
%
%       dist             Distance of viewer from screen (cm)
%       width            Width of screen (cm)
% 
% - Dependencies: <a href="matlab: web('http://psychtoolbox.org/')">Psychtoolbox</a>

% Written by G.M. Boynton - 11/13/07 
% Edited by G.M. Boynton - 9/17/09  
% - Added the 'center' field to ouput of display structure.
% Edited by Kelly Chang - February 15, 2017

%% Input Control

if ~exist('display', 'var')
    display.screen = 0;
end

if ~isfield(display, 'screen')
    display.screen = 0;
end

if ~isfield(display, 'resolution');
    tmp = Screen('Resolution', display.screen);
    display.resolution = [tmp.width tmp.height];
end 

if ~isfield(display, 'bkColor')
    display.bkColor = [0 0 0]; % black
end

if ~isfield(display, 'skipChecks')
    display.skipChecks = true;
end

%% Open Screen

if display.skipChecks % if skipping checks
    Screen('Preference', 'Verbosity', 0);
    Screen('Preference', 'SkipSyncTests', 1);
    Screen('Preference', 'VisualDebugLevel', 0);
    Screen('Preference', 'SuppressAllWarnings', 1);
end

% Open the window
[display.window,res] = Screen('OpenWindow', display.screen, display.bkColor, ...
    [0 0 display.resolution]);

% Set the display parameters 'frameRate' and 'resolution'
display.frameRate = round(1/Screen('GetFlipInterval', display.window)); % Hz

% Calculate the center of the screen
[display.center(1),display.center(2)] = RectCenter(res);