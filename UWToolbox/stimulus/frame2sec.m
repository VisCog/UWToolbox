function [seconds] = frame2sec(display, frames)
% [seconds] = frame2sec(display, frames)
%
% Converts number of frames to time in seconds by calling:
%
% sec = frame * (1/display.frameRate);
%
% Inputs:
%   display           A structure containing display information (see 
%                     OpenWindow.m), must have field:
%       frameRate     Frame rate in Hz, as determined by
%                     Screen('GetFlipInterval'), numeric
% 
%   frames            Number of frames to be converted to time in seconds
%
% Ouput: 
%   seconds           The translated time (seconds) for the given display
%                     information and frames, numeric

% Written by Kelly Chang - November 28, 2017

%% Convert Seconds to Frames

seconds = frames * (1/display.frameRate);