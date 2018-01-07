function [display] = OpenWindow(display)
% [display] = OpenWindow(display)
%
% Calls the Psychtoolbox command Screen('OpenWindow') using a 'display'
% structure convention.
%
% Input:
%   display             A structure containing display information with 
%                       fields, optional:
%       screen          Screen Number (default: maximum screen available)
%       resolution      A vector of screen [width height] to be opened in
%                       pixels (default: full screen)
%       bkColor         Background color (default: black [0 0 0])
%       skipChecks      Flag for skipping screen synchronization, logical.
%                       When set to true Screen('Preference') is set to: 
%                           'Verbosity' level is 0  
%                           'SkipSyncTests' is true
%                           'VisualDebugLevel' level is 0
%                           'SuppressAllWarnings' is true
%                       (default: true, skip all checks)
%       debug           Flag for opening window to open at fourth of the
%                       full screen resolution to access to the command
%                       window (default: false)
% -------------------------------------------------------------------------
%   display             For full functionality, the additional fields of 
%                       should be filled:
%       dist            Distance of viewer from screen, numeric (cm)
%       width           Width of screen, numeric (cm)
%
% Output:
%   display             Same structure as passed in, but with additional 
%                       fields filled in:
%       windowPtr       Pointer to window, as returned by
%                       Screen('OpenWindow'), numeric
%       frameRate       Frame rate (hz), as determined by 
%                       Screen('GetFlipInterval'), numeric
%       center          A vector of the screen [x y] center in pixels 
%
% Notes: 
% - Dependencies: <a href="matlab: web('http://psychtoolbox.org/')">Psychtoolbox</a>

% Written by G.M. Boynton - 11/13/07 
% Edited by G.M. Boynton - 9/17/09  
% - Added the 'center' field to ouput of display structure.
% Edited by Kelly Chang - November 28, 2017

%% Input Control

if ~exist('display', 'var')
    display = struct();
end

if ~isfield(display, 'screen')
    display.screen = max(Screen('Screens'));
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

if ~isfield(display, 'debug')
    display.debug = false;
end

%% Open Screen

if display.skipChecks % if skipping checks
    Screen('Preference', 'Verbosity', 0);
    Screen('Preference', 'SkipSyncTests', 1);
    Screen('Preference', 'VisualDebugLevel', 0);
    Screen('Preference', 'SuppressAllWarnings', 1);
end

if display.debug % if debugging
    display.resolution = floor(display.resolution / 4);
end

% Open the window
[display.windowPtr,res] = Screen('OpenWindow', display.screen, display.bkColor, ...
    [0 0 display.resolution]);

% Get the display parameters 'frameRate'
display.frameRate = round(1/Screen('GetFlipInterval', display.windowPtr)); % Hz

% Calculate the center of the screen
[display.center(1),display.center(2)] = RectCenter(res);