function [es,speciesDay] = translateTime(species, day, time)
% [es,speciesDay] = translateTime(species, day, time)
% 
% Implements the Workman translating time model to translate time across
% species
%
% Note that the Workman model has interaction terms that are not
% implemented, so these numbers will be WRONG for cortical neurogenesis in
% or anything to do with cat retina.
% 
% Inputs:
%   species         Name of the input species, string
%                   Available Species: 'rat', 'ferret', 'human'
%
%   day             Day for the input species, numeric
% 
%   time            'day' started from: Post-Conception ('pc') or 
%                   Post-Natal ('pn'), string (default: 'pc')
% 
% Outputs:
%   es              Workman Event Score, numeric
%
%   speciesDay      A structure with the equivalent Post-Conception or 
%                   Post-Natal days for available species rat, ferret, and
%                   human
%
% Notes:
% - <a href="matlab: web('http://www.translatingtime.net/')">Workman Time Translation Model</a>
% - <a href="matlab: web('http://www.translatingtime.net/species')">Additional Species</a>

% Written by Ione Fine
% Edited by Kelly Chang - November 28, 2017

%% Input Control

if ~exist('time', 'var')
    time = 'pc';
end

if ~any(strcmpi(time, {'pc', 'pn'}))
    time = 'pc';
    warning('Unrecognized pFlag\nSwitch to Post-Conception (%s)', time);
end

%% Post-Concept or Post-Natal Adjustments

switch lower(time)
    case 'pc'
        fprintf('\nUsing Post-Conception (PC) Days:\n\n');
        pc = day;
    case 'pn'
        fprintf('\nUsing Post-Natal (PN) Days:\n\n');
        switch lower(species)
            case 'rat'
                pc = day + 21;
            case 'ferret'
                pc = day + 41;
            case 'human'
                pc = day + 270;
            otherwise
                error('Species not recognized');
        end
end

%% Calculate Workman Event Score

switch lower(species)
    case 'rat'
        es = (log(pc)-2.31) ./ 1.705;
    case 'ferret'
        es = (log(pc)-2.706) ./ 2.174;
    case 'human'
        es = (log(pc)-3.167) ./ 3.72;
    case 'event'
        es = pc;
end

%% Translating Event Score to Day

speciesDay.rat = round(exp(2.31 + 1.705 * es));
speciesDay.ferret = round(exp(2.706 + 2.174 * es));
speciesDay.human = round(exp(3.167 + 3.72 * es));

%% Print to Command Window

fprintf('Event Score = %5.2f\n\n', es);
fprintf('RAT:\tPC = %d, PN = %d\n', speciesDay.rat, speciesDay.rat-21);
fprintf('FERRET:\tPC = %d, PN = %d\n', speciesDay.ferret, speciesDay.ferret-41);
fprintf('HUMAN:\tPC = %d, PN = %d\n', speciesDay.human, speciesDay.human-270);