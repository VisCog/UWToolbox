function timeLeftBar(rep, n, message)
% TIMELEFTBAR Display time based wait bar
% timeLeftBar(rep, n, message) creates and displays
% a variant of waitbar that is in real time
% rep should be the rep value in the loop
% n should be the maximum value for the loop
%
% Example:
% n = 1000;
% for i = 1:n
% % === computation here === %
%   rand(2000);
%   timeLeftBar(i, n, 'message');
% end

% Written by Geoffrey M. Boynton. Edited Ione Fine.
% Edited by Kelly Chang - March 16, 2017

%% Input Control

h = findobj(allchild(0), 'flat', 'Tag', 'TMWWaitbar');
if isempty(h)
    h = waitbar(1); % initialize waitbar if none
    tic;
end

if ~exist('message', 'var')
    message = 'Time left:';
end

if rep > n
    error('timeLeftBar: rep number > maximum number');
end

%% Calculate and Display Time Left

timeLeft = toc*(n-rep)/rep; % seconds
if timeLeft < 60 % less than a minute
    timeLeftStr = sprintf('%d s', floor(timeLeft));
elseif timeLeft < (60*60)  % between one minute and an hour
    timeLeftStr = sprintf('%d min %d s',floor(timeLeft/60), floor(mod(timeLeft,60)));
else % more than an hour (show hours and minutes)
    timeLeftStr = sprintf('%d hr %d min', floor(timeLeft/3600), ...
        floor(floor(mod(timeLeft,3600)/60)));
end
waitbar(rep/n, h, sprintf('%s %s', message, timeLeftStr));

%% Clear Wait Bar Handle

if rep == n
    delete(h);
end