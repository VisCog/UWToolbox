function [t] = makeTexture(display, img)
% [t] = makeTexture(display, img)
%
% Calls the Psychtoolbox command Screen('MakeTexture') of an image 'img' 
% using a 'display' structure convention 
%
% Inputs:
%   display   A structure containing display information (see OpenWindow.m)
%
%   img       Image matrix to be made into a texture
%
% Output:
%   t         Texture index as supplied from calling Screen('MakeTexture')
%
% Note: 
% - Dependencies: <a href="matlab: web('http://psychtoolbox.org/')">Psychtoolbox</a>

% Written by G.M. Boynton 
% Edited by Kelly Chang - February 23, 2017

%% Create Texture

t = Screen('MakeTexture', display.window, img);