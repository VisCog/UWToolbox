function [params] = var2params(var, params, freeList)
% [params] = var2params(var, params, freeList)
%
% Turns varues 'varues' into a field within 'params' with a field name
% given in order from 'freeList'. Support function for 'fit.m' and 
% 'fitcon.m'. 
%
% Inputs:
%   var         New varues to be stored in the 'params' structure under
%               field names (in order) from 'freeList'
%
%   params      A structure of parameter varues with field names that
%               correspond with the parameter names in 'freeList'
%
%   freeList    Cell array containing list of parameter names (strings)
%               that match the field names in 'params'
%
% Output:
%   params      Same 'params' structure with parameter varues as field
%               names that correspond with the parameter names in
%               'freeList' with the varues from 'var'
%
% Notes:
% - Dependencies: str2vec.m

% Written by G.M. Boynton - Summer of '00
% Edited by Kelly Chang - June 21, 2016

%% Input Control

if ischar(freeList)
    freeList = {freeList};
end

%% Assign 'var' into 'params' Structure

count = 1;
freeList = regexprep(freeList, '[= ]', '');
varStr = regexprep(freeList, '(\(.*\))', '');
numList = regexp(freeList, '(\(.*\))', 'match');
for i = 1:length(varStr) 
    indx = str2vec(params.(varStr{i}), char(numList{i}));
    params.(varStr{i})(indx) = var(count:(count + length(indx) - 1));
    count = count + length(indx);
end