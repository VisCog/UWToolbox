function [es,speciesDay] = translatingTime(day, species, pFlag)
% [es,] = translatingTime(day, species, pFlag)
% 
% Implements the Workman translating time model to translate time across
% species
%
% Note that the Workman model has interaction terms that are not
% implemented, so these numbers will be WRONG for cortical neurogenesis in
% or anything to do with cat retina.
% 
% Input:
%   day             Day for the input species
% 
%   species         Name of the input species, string 
%                   Available Species: 'rat', 'ferret', 'human'
% 
%   pFlag           Post-Conception ('pc') or Post-Natal ('pn') 
%                   (default: 'pc')
% 
% Outputs:
%   es              Workman event score
%   speciesDay      A structure with the equivalent Post-Conception or 
%                   Post-Natal day for rat, ferret, and human
%
% Notes:
% - <a href="matlab: web('http://www.translatingtime.net/')">Workman Time Translation Model</a>
% - <a href="matlab: web('http://www.translatingtime.net/species')">Additional Species</a>

%% Input Control

if ~exist('pFlag', 'var')
    pFlag = 'pc';
end

if ~any(strcmpi(pFlag, {'pc', 'pn'}))
    warning('Unrecognized pFlag');
    pFlag = 'pc';
end

%% Post-Concept or Post-Natal Adjustments

switch lower(pFlag)
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
        es = (log(pc)-2.31)./1.705;
    case 'ferret'
        es = (log(pc)-2.706)./2.174;
    case 'human'
        es = (log(pc)-3.167)./3.72;
    case 'event'
        es = pc;
end

%% Translating Event Score to Day

speciesDay.rat = round(exp(2.31 + 1.705 * es));
speciesDay.ferret = round(exp(2.706 + 2.174 * es));
speciesDay.human = round(exp(3.167 + 3.72 * es));

%% Command Window Printing

fprintf('Event Score = %5.2f\n\n', es);
fprintf('RAT:    PC = %d, PN = %d\n', speciesDay.rat, speciesDay.rat-21);
fprintf('FERRET: PC = %d, PN = %d\n', speciesDay.ferret, speciesDay.ferret-41);
fprintf('HUMAN:  PC = %d, PN = %d\n', speciesDay.human, speciesDay.human-270);