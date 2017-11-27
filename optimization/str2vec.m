function [indx] = str2vec(param, str)
% [indx] = str2vec(param, str)
%
% Extracts linearized 'indx' indices from 'param' parameter corresponding
% with 'str'. Support function to 'params2var.m', 'params2varcon.m', and
% 'var2params.m'.
%
% Inputs:
%   param       The parameter that has values that are to be fitted
%
%   str         A string of the values within 'params' that to be fitted
%               (i.e., if params were a vector of [1 5] size and only the
%               4th and 5th values are to be fitted, the corresponding
%               string would be '(4:5)').
%
% Output:
%   indx        Linearized index into 'param' of the values to be fitted.
%               If 'str' was empty, then returns all indices

% Written by Kelly Chang - November 20, 2017

%% Linearize Index for Value(s) to be Fitted in 'param'

if isempty(str)
    indx = 1:numel(param);
else
    if ~isempty(regexp(str, '(\(|,):', 'once'))
        dims = discretize(regexp(str, '(\(|,):'), [0 regexp(str, ',') length(str)]);
        for i = 1:length(dims)
            indx = regexp(str, '(\(|,):', 'once');
            str = [str(1:indx) sprintf('1:size(param,%d)',dims(i)) str((indx+2):end)];
        end
    end
    indx = eval(sprintf('CombVec%s;', str));
    nIndx = arrayfun(@(x) sprintf('indx(%d,:)',x), 1:size(indx,1), 'UniformOutput', false);
    indx = eval(sprintf('sub2ind(size(param),%s);', strjoin(nIndx, ',')));
end