function [out] = xls2struct(filename, sheet, range, fields)
% [out] = xls2struct(filename, sheet)
%
% Reads Microsoft Excel spreadsheet and returns a structure with fields
% that were the headers of the data from an Excel file 'filename' and sheet
% 'sheet'.
%
% If columns of all the same data class, will return a vectorized form of
% the data as opposed to a cell array.
%
% Inputs:
%   filename        Name of the  Microsoft Excel speadsheet, string
%
%   sheet           Nane of the specific worksheet to read, string
%                                         OR
%                   Positive, integer of the worksheet index, numeric
%                   (default: first worksheet)
%
%   range           String that specifies a rectangular portion of the
%                   worksheet to read. Not case sensitive. Use Excel A1
%                   reference style. If you do not specify a 'sheet', 
%                   'range' must include both corners and a colon character
%                   (:), even for a single cell (such as 'D2:D2')
%                   (default: entire readable range)
%
%   fields          Cell array that contains the field names into which
%                   columns will be assigned length(fieldnames) must equal 
%                   the number of columns being read in
%                   (default: 'header<n>')
%
% Output:
%   out             A structure containing the data extracted from the
%                   Microsoft Excel worksheet with fields that correspond
%                   to the worksheets innate headers or given from 'fields'
%
% Note:
% - Dependency: rmspace.m

% Written by Ione Fine
% Editied by Kelly Chang - November 28, 2017

%% Input Control

if ~exist('sheet', 'var')
    sheet = '';
end

if ~exist('range', 'var') || isempty(range)
    range = '';
end

%% Extract Raw Data from Excel File

[~,txt,raw] = xlsread(filename, sheet, range);
if exist('fields', 'var') && length(fields) > size(raw,2)
    error('The number of fields provided must equal the number of columns');
end

%% Assign Header / Field Names

if exist('fields', 'var') && isequal(txt(1,:), raw(1,:)) 
    fields = rmspace(fields);
    raw = raw(2:end,:);
elseif exist('fields', 'var') && ~isequal(txt(1,:), raw(1,:)) 
    fields = rmspace(fields);
elseif isequal(txt(1,:), raw(1,:)) % headers
    fields = rmspace(txt(1,:));
    raw = raw(2:end,:);
else % no headers
    fields = arrayfun(@(x) sprintf('header%d',x), 1:size(raw,2), 'UniformOutput', false);
end
raw = [fields; raw];

%% Create Output Structure

out = struct(); % initialize output
for i = 1:size(raw,2)
    data = raw(2:end, strcmp(fields(i), raw(1,:)));
    if all(cellfun(@(x) strcmp(class(x), class(data{1})), data)) && ~ischar(data{1})
        out.(fields{i}) = cell2mat(data);
    else
        out.(fields{i}) = data;
    end
end