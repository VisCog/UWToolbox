function [var] = params2var(params, freeList)
% [var] = params2var(params, freeList)
%
% Extracts 'freeList' fields from 'params' structure and outputs into a row
% vector 'var'. Support function for 'fit.m'
% 
% Inputs:
%   params      A structure of parameter values with field names that
%               correspond with the parameter names in 'freeList'
% 
%   freeList    Cell array containing list of parameter names (strings)
%               that match the field names in 'params'
%
% Output:
%   var         Values extracted from the 'params' structure with field
%               names (in order) from 'freeList'

% Written by G.M Boynton, Summer of '00
% Edited by Kelly Chang, February 10, 2017

%% Input Control

if ischar(freeList)
    freeList = {freeList};
end

varStr = regexprep(freeList, '(\(.*\))', '');
numList = cellfun(@(x) regexprep(x,'[()]',''), regexp(freeList, '(\(.*\))', 'match'), 'UniformOutput', false);
if ~all(ismember(varStr, fieldnames(params)))
    errFlds = setdiff(fieldnames(params), varStr);
    error('Unknown ''freeList'' parameters: %s', strjoin(errFlds, ', '));
end

%% Extract 'freeList' Fields from 'params'

var = cell(1,length(varStr));
for i = 1:length(varStr)
    if isempty(numList{i})
        var{i} = params.(varStr{i});
    else
        var{i} = params.(varStr{i})(str2num(char(numList{i})));
    end
end
var = cell2mat(var);