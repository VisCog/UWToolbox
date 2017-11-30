%% MiscDemo.m
%

%% nansem.m
% 
% A function that will calculate the standard error of the mean about a
% selected dimension of a vector / matrix.

x = magic(5)
sem1 = nansem(x) 
sem2 = nansem(x,2)

%% rmspace.m
%
% A helpful function that will remove all spaces / whitespace characters
% from a string or a cell array of strings

out = rmspace('4 6  34 cat') % string
out = rmspace({'H e l       lo   ', '        W  or  ld'}) % cell array

%% timeLeftBar.m
%
% A variant of the wait bar. Displays real time left instead of progress
% left.

n = 1000;
for i = 1:n
    % === computation here === %
    rand(2000);
    timeLeftBar(i, n, 'message');
end

%%
% 
% <<timeLeftBarExample.png>>

%% translateTime.m
%
% A convenient function that implements the 
% <http://www.translatingtime.net Workman Time Translation Model> to 
% translate time across species. Currently, the function is able to 
% translate for rat, ferret, and human post-conception (pc) or post-natal
% (pn) days.

translateTime('rat', 2, 'pc');

%% xls2struct.m
% 
% A function that reads Microsoft Excel spreadsheets and returns a
% structure with fields that were the headers of the data. Can handle
% worksheets with headers:
%
% <<headersExample.png>>

s = xls2struct('xls2structExample.xlsx', 'headers')
s.header1

%%
% or no headers:
%
% <<noHeadersExample.png>>

s = xls2struct('xls2structExample.xlsx', 'noheaders')
s.header1