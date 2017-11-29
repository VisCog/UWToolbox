function m = nonansem(y,dim)
% m = nonansem(y, dim)
% 
% Calculates the standard error of the mean (SEM) on matrix y, ignoring 
% nans. Can be calculated column-wise or row-wise.
% 
% Inputs:
%   y           The matrix to calculate the SEM            
%   dim         Dimension number along which the SEM is calcuated (default:
%               1, column-wise)
% 
% Output:
%   m           Vector of calculated SEM from matrix y

% Written by G.M. Boynton
% Edited by Kelly Chang - March 16, 2017

%% Input Control

if ~exist('dim', 'var')
    dim = 1;
end

%% Calculate SEM

m = cellfun(@(x) std(x(~isnan(x)))/sqrt((length(x))-sum(isnan(x))), num2cell(y,dim));