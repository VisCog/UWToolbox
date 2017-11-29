function [frames] = secs2frames(display, seconds)
% [frames] = secs2frames(display, seconds)
%
% Converts time in seconds to frames by calling:
%
% frames = ceil(seconds * display.frameRate)
% 
% Inputs:
%   display           A structure containing display information (see 
%                     OpenWindow.m), must have field:
%       fr            Frame rate in Hz, as determined by
%                     Screen('GetFlipInterval'), numeric
% 
%   seconds           Time in seconds to be converted to frames, seconds
%
% Ouput: 
%   frames            The translated number of frames for the given display
%                     information and seconds, numeric

% Written by G.M. Boynton - 11/16/07 
% Edited by Kelly Chang - February 23, 2017

%% Convert Seconds to Frames

frames = ceil(seconds * display.fr);