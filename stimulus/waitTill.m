function [keys,RT] = waitTill(waitTime, startTime, deviceNum)
% [keys,RT] = waitTill(waitTime, startTime, deviceNum)
%
% Returns a vector of keys pressed and the timing of the presses during an
% interval of 'waitTime' seconds. By default, the clock starts within the
% function, but if 'startTime' is provided then the function will return
% 'waitTime' seconds after 'startTime' was defined with 'GetSecs'.  
%
% An empty variable is returned if no key was pressed during the interval.
%
% Inputs:
%   waitTime        Interval to wait, seconds. If called without 
%                   'startTime', will wait 'waitTime'. If called with a
%                   'startTime', will wait
% 
%   startTime       Reference time for 'waitTime' interval, seconds
%                   (default: when 'waitTill' is called)
% 
%   deviceNum       Number of keyboard device being queried (default: -3, 
%                   for all keyboard devices, see KBCHECK.m for additional
%                   information about keyboard querying numbers)
%
% Outputs:
%   keys            Cell array of strings of key names pressed during 
%                   'waitTime' interval
% 
%   RT              Vector of reaction times for corresponding keys pressed
%                   during 'waitTime' interval
%
% Note:
% - Dependencies: <a href="matlab: web('http://psychtoolbox.org/')">Psychtoolbox</a>

% Written by G.M. Boynton at the University of Washington - 3/24/09
% Edited by Kelly Chang - February 13, 2017

%% Input Control

% Assign device number to all keyboards if no device number was provided
if ~exist('deviceNum', 'var')
    deviceNum = -3;
end

% Read the clock if no clock time was provided
if ~exist('startTime','var')
    startTime = GetSecs();
end

% give a warning if the waiting interval is zero or less
if (GetSecs()-startTime) > waitTime
    disp('Warning! waitTill: waiting interval is less than zero')
end

%% Start WaitTill Process

ListenChar(2); % suppress output to the command window

% initialize the output variables
keys = {};
RT = [];

nKeys = 0;
% loop until waitTime seconds has passed since startTime was defined
while (GetSecs()-startTime) < waitTime
    [keyIsDown,timeSecs,keyCode] = KbCheck(deviceNum); % see if a key is pressed
    if keyIsDown % if key is down, record the key and time pressed
        nKeys = nKeys + 1;
        RT(nKeys) = timeSecs-startTime;
        keys{nKeys} = KbName(keyCode);
        while KbCheck(deviceNum); end % clear keyboard buffer 
    end
end
ListenChar(0); % restore outout to command window