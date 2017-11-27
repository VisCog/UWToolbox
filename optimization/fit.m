function [params,err] = fit(funName, params, freeList, varargin)
% [params,err] = fit(funName, params, freeList, var1, var2,...)
%
% Helpful interface to MATLAB's 'fminsearch' function.
%
% Inputs:
%   funName        Function to be optimized. Must have form
%                  [err] = <funName>(params, var1, var2, ...)
%
%   params         A structure of with field names that correspond to 
%                  parameter values for fitted function. Params are allowed
%                  to be matrices.
%       options    A structure with options for MATLAB's fminsearch program
%                  (see OPTIMSET)
%
%   freeList       Cell array containing list of parameter names (strings)
%                  to be free in fitting. Free strings can contain certain
%                  values / ranges within the 'params' matrices. For 
%                  example, the following are valid.
%
%                  {'x(1)','y(3:4)', 'z(1:2,4:5)'}
%
%   var<n>         Extra variables to be sent into fitted function
%                  'funName'
%
% Outputs:
%   params         A structure with best fitting parameters as fieldnames
%
%   err            Error value at minimum, numeric
%
% Notes:
% - Dependencies: params2var.m, var2params.m, fitFunction.m

% Written by Geoffrey M. Boynton, Summer of '00
% Edited by Kelly Chang, February 10, 2017

%% Input Control

options = []; % options for fminsearch (see OPTIMSET)
if isfield(params, 'options')
    options = params.options;
end

if isempty(freeList)
    freeList = fieldnames(params);
end

%% Fit Function and Calculate Final Error

% turn free parameters in to 'var'
vars = params2var(params, freeList);

% calling fminsearch
vars = fminsearch('fitFunction', vars, options, funName, params, freeList, varargin);

% assign final parameters into 'params'
params = var2params(vars, params, freeList);

% evaluate the function 'funName' for error at minimum
err = fitFunction(vars, funName, params, freeList, varargin);