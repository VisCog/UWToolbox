% TestFit.m



% addpath('../');  


%
%% Example 1: 2 Rosenbrock function
%
% A classic 2-parameter function used to test nonlinear optimization
% routines is the 'Rosenbrock' function.  It has a shallow curved minimum
% that wreaks havoc on the simplest routines.  It has the form:
%
% f(x, y) = (a-x)^2 + b(y-x^2)^2
%
% Where a = 1 and b = 100 by default. 
% The minimum is zero at x = a, y = a^2 

p.x = -1;
p.y = 2;
f = rosenbrock(p);

fprintf('f(%g,%g) = %g\n', p.x, p.y, f);

%% Visualize the function as a surface in 2d

[x,y] = meshgrid(linspace(-1.5,2,201),linspace(-.5,3,201));
psurf.x = x;
psurf.y = y;
f = rosenbrock(psurf);

figure(1)
clf
hold on
surf(psurf.x(1,:),psurf.y(:,1),f);
shading interp
view(-40,20);

xlabel('x');
ylabel('y');

%%
% This builds a color map that roughly matches the image from the Wikipeida
% page:

tmp = hot(400);
cmap = flipud(tmp(1:256,:));
cmap(1,:) = [0,0,1];
colormap(cmap);

%%
% Use 'fit' to find the minimum. Use the initial values
% from before.  First we'll define the parameters 'x' and 'y' in the
% structure that we want to be allowed to vary.  These are listed in a cell
% array of strings:

freeParams = {'x', 'y'};

[pBest,fBest] = fit('rosenbrock', p, freeParams);

fprintf('The minimum of the Rosenbrock is %g at (%g,%g)\n', ...
    fBest, pBest.x, pBest.y);

%%
% Within rounding error, the minimum should be zero at (1,1)

% Here's the location of the minimum on the plot of the surface:
plot3(pBest.x, pBest.y, fBest, 'ko', 'MarkerFaceColor', 'g');

%%
% Use 'fitcon.m' to find the minimum, but the parameter search will be 
% constrained by inequalities passed through in the freeList

[pCon,fCon] = fitcon('rosenbrock', p, {'x>2', 'y'});
% [pCon,fCon] = fitcon('rosenbrock', p, {'x>2', '0<y<.5'});
% [pCon,fCon] = fitcon('rosenbrock', p, {'x>3'});
% [pCon,fCon] = fitcon('rosenbrock', p, {'y<0'});

% Here's the location of the constained minimum on the plot of the surface:
plot3(pCon.x, pCon.y, fCon, 'ko', 'MarkerFaceColor', 'y');
