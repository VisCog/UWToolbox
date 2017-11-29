function [Y] = nansem(x, dim, flag)
% [Y] = nansem(x, dim, flag)
% 
% Calculates the standard error of the mean while ignoring NaNs.
% The sample standard error of the values in X is calculated by treating
% NaNs as missing values. 
%
% NANSEM normalizes Y by (N-1), where N is the sample size.  This is the
% square root of an unbiased estimator of the variance of the population
% from which X is drawn, as long as X consists of independent, identically
% distributed samples and data are missing at random.
%
% Inputs:
%   x           A vector or matrix of numeric value, upon which the 
%               standard error of the mean will be calculated.
%   
%   dim         The dimension along which the standard error of the mean
%               will be calculated in X (default: first non-singleton 
%               dimension)
%
%   flag        Boolean flag indicating whether to normalize by N and
%               produces the square root of the second moment of the sample 
%               about its mean (default: false)
%
% Output: 
%   Y           The sample standard error of the values in X along the 
%               selected dimension, treating NaNs as missing values 

% Written Geoffrey Boynton, edited Ione Fine
% Edited by Kelly Chang - November 28, 2017

%% Input Control

if ~exist('x', 'var') || isempty(x)
    Y = NaN('like', []); return;
end

if ~exist('flag', 'var') || isempty(flag)
    flag = false;
end

sz = size(x);
if ~exist('dim', 'var') || isempty(dim)
    dim = find(sz ~= 1, 1); % non-singleton dimension
end

if dim > ndims(x)
    dim = find(sz ~= 1, 1);
    warning('Dimension selected exceeds given input dimensions\nFirst non-singleton dimension selected (dim = %d)', dim);
end

%% Calculate Standard Error of the Mean (ignoring NaNs)

% standard deviation of non NaN values along selected dimension
s = nanstd(x,flag,dim);

% count of non NaN values along selected dimension
n = sum(~isnan(x),dim); 

% calculate sem
Y = s ./ sqrt(n);