function f = rosenbrock(p,a,b)
% f = rosenbrock(p,a,b)
%
% Default values: a = 1, b =100;
%
% From Wikipedia (https://en.wikipedia.org/wiki/Rosenbrock_function):
%
% In mathematical optimization, the Rosenbrock function is a non-convex
% function used as a performance test problem for optimization algorithms
% introduced by Howard H. Rosenbrock in 1960.[1] It is also known as
% Rosenbrock's valley or Rosenbrock's banana function.
% 
% The global minimum is inside a long, narrow, parabolic shaped flat
% valley. To find the valley is trivial. To converge to the global minimum,
% however, is difficult.
% 
% The function is defined by
% f(x, y) = (a-x)^2 + b(y-x^2)^2
% It has a global minimum at (x, y)=(a, a^2), where f(x, y)=0. 
%
% Written by gmb 7/17/2015

if ~exist('a','var')
    a = 1;
end

if ~exist('b','var')
    b = 100;
end

f = (a-p.x).^2 + b*(p.y-p.x.^2).^2;