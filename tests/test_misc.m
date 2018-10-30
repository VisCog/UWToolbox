% Test suite for the misc module
%
% This is using MOxUnit, a lightweight unit test framework
% that works on both Matlab and GNU Octave. Travis-CI can't
% run Matlab, so it will run all tests in Octave.
%
% It is crucial that the output of the main function is a variable named
% `test_suite`:
function test_suite = test_misc()
    initTestSuite;
end

% Then, define subfunctions whose names start with 'test' or end with 'test'
% (case-insensitive). These functions can use the following assert functions:
%
% - assertTrue(a): assert that `a` is true.
% - assertFalse(a): assert that `a` is false.
% - assertEqual(a,b): assert that `a` and `b` are equal.
% - assertElementsAlmostEqual(a,b): assert that the floating point arrays `a`
%   and `b` have the same size, and that corresponding elements are equal
%   within some numeric tolerance.
% - assertVectorsAlmostEqual(a,b): assert that floating point vectors `a` and 
%   `b` have the same size, and are equal within some numeric tolerance based
%   on their vector norm.
% - assertExceptionThrown(f,id): assert that calling ``f()`` throws an
%   exception with identifier `id`. (To deal with cases where Matlab and GNU
%   Octave throw errors with different identifiers, use
%   `moxunit_util_platform_is_octave`. Or use `id='*'` to match any
%   identifier).
% More info: https://github.com/MOxUnit/MOxUnit


function test_nansem()
    assertEqual(nansem([4 6 NaN 8 10 12]), std([4 6 8 10 12])/sqrt(5))
end


function test_rmspace()
    % rmspace should work for strings and arrays:
    assertEqual(rmspace('4 6  34 cat'), '4634cat')
    assertEqual(rmspace({'4 6', '34 cat'}), {'46', '34cat'})

    % rmspace should work for multiple spaces, even when they're in
    % the beginning or at the end:
    assertEqual(rmspace({'m  e o w', ' w oof '}), {'meow', 'woof'})
end

function test_rmspace_exceptions()
    % rmspace should throw an error if neither 'char' nor 'cell'
    % This has a somewhat annoying syntax: @()function(args), and the ''
    % stands for "any thrown error is fine". You can enforce the type
    % of exception thrown, but they will differ between Matlab and Octave:
    % https://github.com/MOxUnit/MOxUnit/blob/master/README.md
    assertExceptionThrown(@()rmspace(123.4), '')
end
