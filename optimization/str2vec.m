function [indx] = str2vec(paramSize, str)
% [indx] = str2vec(paramSize, str)
%
% Inputs: 
%   paramSize
%   str
%
% Output:
%   indx

% Written by Kelly Chang - November 20, 2017

%%

if isempty(str)
    indx = 1:prod(paramSize);
else
    indx = eval(sprintf('CombVec%s;', str));
    nIndx = arrayfun(@(x) sprintf('indx(%d,:)',x), 1:size(indx,1), 'UniformOutput', false);
    indx = eval(sprintf('sub2ind(paramSize,%s);', strjoin(nIndx, ',')));
end