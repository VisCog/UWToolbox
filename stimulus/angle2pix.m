function [pix] = angle2pix(display, ang)
% [pix] = angle2pix(display, ang)
%
% Converts visual angles in degrees to pixels.
%
% Inputs:
%   display             A structure containing display information with 
%                       fields:
%       dist            Distance from screen, cm
%       width           Width of screen, cm
%       resolution      Screen resolution [width height], pixels
% 
%   ang                 Visual angle to be converted to pixels, degrees
%
% Output: 
%   pix                 Converted 'ang' to pixels, pixels
%
% Example:
% display.dist = 60; % cm
% display.width = 44.5; % cm
% display.resolution = [1680 1050]; % pixels
% 
% ang = 2.529; % visual angle to convert, degrees
% pix = angle2pix(display, ang); % pixels
% 
% Note:
% - Warning: Assumes isotropic (square) pixels

% Written by G.M. Boynton & Zach Ernst - 11/1/07
% Edited by Kelly Chang - February 23, 2017

%% Convert Visual Angles to Pixels 

pixSize = display.width / display.resolution(1); % cm/pix
sz = 2*display.dist*tan(pi*ang/(2*180)); % cm
pix = round(sz/pixSize); % pixels