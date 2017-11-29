function out = xls2struct(filename, sheet)
% [out] = xls2struct(filename, sheet)
%
% Returns a structure with fields that were the headers of the data from 
% an Excel file 'filename' and sheet 'sheet' 
%
% Inputs: 
%   filename
%   sheet
%
% Output:
%   out

% Written by Ione Fine(?)
% Editied by Kelly Chang - March 16, 2017

%% Input Control

if ~exist('sheet', 'var');
    sheet = '';
end

%% Extract Data from Excel File

[~,txt,raw] = xlsread(filename, sheet);
headers = rmspaces(txt(1,:));
flds = headers(~cellfun(@isempty, headers));
raw = raw(1:size(txt,1),:);

%% Create Output Structure

out = []; % initialize output
for i = 1:length(flds)
    out.(flds{i}) = raw(2:end, strcmp(headers,flds{i}));
end