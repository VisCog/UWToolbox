function [out] = rmspace(str)
% [out] = rmspace(str)
% 
% Removes all whitespace in a string or a cell array.
%
% Input: 
%   str          A string or cell array of strings
%
% Output: 
%   out          String or cell array with spaces removed.   
% 
% Example:
% out = rmspace({'4 6  34 cat'})

% Written Geoffrey M. Boynton
% Edited Ione Fine 2/24/2017
% Edited Kelly Chang - November 27, 2017

%% Remove Spaces

switch class(str)
    case 'char'
        out = regexprep(str,'[\s]','');
    case 'cell'
        out = cellfun(@(x) regexprep(x,'[\s]',''), str, 'UniformOutput', false);
    otherwise
        error('Unrecognized data class: %s\n', class(str));
end