function Y=nansem(x, varargin)
%NANSEM Standard error of the mean, ignoring NaNs.
%   Y = NANSEM(X) returns the sample standard error of the values in X,
%   treating NaNs as missing values.  For a vector input, Y is the standard
%   error of the non-NaN elements of X.  For a matrix input, Y is a row
%   vector containing the standard error of the non-NaN elements in
%   each column of X. For N-D arrays, NANSEM operates along the first
%   non-singleton dimension of X.
%
%   NANSEM normalizes Y by (N-1), where N is the sample size.  This is the
%   square root of an unbiased estimator of the variance of the population
%   from which X is drawn, as long as X consists of independent, identically
%   distributed samples and data are missing at random.
%
%   Y = NANSEM(X,1) normalizes by N and produces the square root of the
%   second moment of the sample about its mean.  NANEM(X,0) is the same as
%   NANSEM(X).
%
%   Y = NANSEM(X,FLAG,DIM) takes the standard deviation along dimension
%   DIM of X.
%
%   See also STD, NANVAR, NANMEAN, NANMEDIAN, NANMIN, NANMAX, NANSUM,
%   NANSTD

%   Written Geoffrey Boynton, edited Ione Fine

sz = size(x);
if nargin < 2 || isempty(dim)
    % The output size for [] is a special case when DIM is not given.
    if isequal(x,[]), y = NaN('like',x); return; end
    
    % Figure out which dimension sum will work along.
    dim = find(sz ~= 1, 1);
    if isempty(dim), dim = 1; end
elseif dim > length(sz)
    sz(end+1:dim) = 1;
end

% Need to tile the mean of X to center it.
tile = ones(size(sz));
tile(dim) = sz(dim);

% Count up non-NaNs.
n = sum(~isnan(x),dim);

Y = sqrt(nanvar(varargin{:}))/n;

end % function

