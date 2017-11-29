function out = rmspaces(in)
%   OUT = RMSPACES(IN)
% 
%   Removes spaces in a string or cell array.
% 
%   Example:
%   out = rmspaces({'4 6  34 cat'})
%
%   Written Geoffrey M. Boynton
%   Edited Ione Fine 2/24/2017
%   Edited Kelly Chang 3/16/2017

charFlag = false;
if ischar(in); in = {in}; charFlag = true; end;
out = cellfun(@(x) regexprep(x,'[\s]',''), in, 'UniformOutput', false);
if charFlag; out = out{1}; end;