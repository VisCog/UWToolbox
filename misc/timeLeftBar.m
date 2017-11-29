function timeLeftBar(i, n, msg)
% timeLeftBar(i, n, msg)
% 
% Creates and displays a real time based wait bar (instead of progress 
% based).
% 
% Inputs: 
%   i            The iterated value the loop is currently on, numeric
%
%   n            The maximum value the loop will go through, numeric
%
%   msg          The message the wait bar displays, string 
%                (default: 'Time Left:')
%
% Example:
% n = 1000;
% for i = 1:n
% % === computation here === %
%   rand(2000);
%   timeLeftBar(i, n, 'message');
% end

% Written by Geoffrey M. Boynton. Edited Ione Fine.
% Edited by Kelly Chang - November 28, 2017

%% Input Control

h = findobj(allchild(0), 'flat', 'Tag', 'TMWWaitbar');
if isempty(h)
    h = waitbar(1); % initialize waitbar if none
    tic; % start time
end

if ~exist('msg', 'var')
    msg = 'Time Left:';
end

if i > n
    error('timeLeftBar: i number > maximum number');
end

%% Calculate and Display Time Left

timeLeft = toc*(n-i)/i; % seconds
if timeLeft < 60 % less than a minute
    timeLeftStr = sprintf('%d s', floor(timeLeft));
elseif timeLeft < (60*60)  % between one minute and an hour
    timeLeftStr = sprintf('%d min %d s', floor(timeLeft/60), floor(mod(timeLeft,60)));
else % more than an hour (show hours and minutes)
    timeLeftStr = sprintf('%d hr %d min', floor(timeLeft/3600), ...
        floor(floor(mod(timeLeft,3600)/60)));
end
waitbar(i/n, h, sprintf('%s %s', msg, timeLeftStr)); % update wait bar

if i == n  % clean up wait bar
    delete(h);
end