function [ang] = pix2angle(display, pix)
% [ang] = pix2angle(display, pix)
%
% Converts monitor pixels into degrees of visual angle:
%
% ang = 2 * arctan(sz/(2*dist)) * (180/pi);
%
% Inputs:
%   display             A structure containing display information with 
%                       fields:
%       dist            Distance from screen, cm
%       width           Width of screen, cm
%       resolution      Screen resolution [width height], pixels
% 
%   pix                 Pixels to be converted to visual angles, pixels
%
% Output: 
%   ang                 Converted 'pix' to visual angle, degrees
%
% Example:
% display.dist = 60; % cm
% display.width = 44.5; % cm
% display.resolution = [1680 1050]; % pixels
%
% pix = 100; % pixel size to convert
% ang = pix2angle(display, pix) % visual angles, degrees
% 
% Note:
% - Warning: Assumes isotropic (square) pixels

% Written by G.M. Boynton & Zach Ernst - 11/1/07
% Edited by Kelly Chang - February 23, 2017

%% Convert Pixels to Visual Angels

pixSize = display.width / display.resolution(1); % cm/pix
sz = pix * pixSize; % cm
ang = 2*atan(sz/(2*display.dist))*(180/pi); % visual angle, degrees