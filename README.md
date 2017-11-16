## UW Toolbox 

This is a work in progress

Functions that are in reasonable shape are described in the read me. Use other stuff at your own peril.

Contains Matlab tools for vision/fmri/psychophysics resarch.  

# misc

nansem: equivalent of nanstd, but calculated the sem

rmspaces: removes space in a string or cell array

translatingtime: utility for converting pre- post-natal ages across species

timeLeftBar: variant of waitbar that shows the predicted amount of time left (instead of the percent complete)

xls2struct: reads in a excel file and passes each column into a struct field
xls2structDemo

# optimization

test_funntion

fit - helpful interface to fminsearch, especially good when you need flexibility in which variables are being estimated
params2var - support function for fit
var2params - support function for fit

fitcon - variant of fit that can restrict the range of parameter searches

params2varcon - support function for fitcon


# psychometricfunctions

PsychometricFunctionDemo

fitPsychometricFunction - finds the best fitting parameters to fit a cummulative normal
 or weibull to data


plotPsycho - plots psychometric functions on data, including error bars and symbol 
sizes that show the number of trials for each stimulus intensity level

normcdfS2P - calls normcdf, using a structure as input 

Weibull - generates the weibull function


# Backwards compatibility

gamma - replaced with gammaHRF to avoid conflicts with Matlab functions

nonanean - removed, use Matlab's nanmean instead

nonanstd - removed, use Matlab's nanstd instead

nonansem - renamed nansem, moved to misc folder and made compatible with Matlab's nanmean

NormalCDF - removed, replaced with normcdf and normcdfS2P
 
rmSpaces - renamed to rmspaces

Weibull - renamed to weibull




---

# Contributors

Creator: Geoffrey Boynton - @gboynton 

Ione Fine - @ionefine - ionefine@uw.edu

Kelly Chang - @kellychang4 - kchang4@uw.edu