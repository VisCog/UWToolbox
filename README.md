## UW Toolbox 

This is a work in progress, more functions / folders will be added as they have been tested and are functional.

Kelly is currently in charge of organizing this toolbox, so email her if you have questions!

---

# tutorials

Collection HTML rendered tutorials for various implementations of toolbox scripts.

[misc](http://htmlpreview.github.io/?https://github.com/VisCog/UWToolbox/blob/master/tutorials/misc/MiscDemo.html)

[optimization](http://htmlpreview.github.io/?https://github.com/VisCog/UWToolbox/blob/master/tutorials/optimization/FitDemo.html)

---

# misc

nansem.m -  Calculates the standard error of the mean while ignoring NaNs.

rmspace.m - Removes all whitespace in a string or a cell array.

timeLeftBar.m -  Creates and displays a real time based wait bar (instead of progress based).

translateTime.m -  Implements the [Workman Translating Time Model](http://www.translatingtime.net/) to translate time across species

xls2struct.m -  Reads Microsoft Excel spreadsheet and returns a structure with fields that were the headers of the data or creates headers for the data
- Example file: xls2structExample.xlsx

MiscDemo.m - raw misc folder tutorial script

---

# optimization

fit.m - Helpful interface to MATLAB's 'fminsearch' function. Performs a non-linear minimization algorithm.

fitcon.m - Helpful interface to MATLAB's 'fmincon' function. Performs a non-linear minimization algorithm within specified constrained boundaries. If problem does not require constraints, use fit.m for efficiency.

Support Function / Dependencies:
- fitFunction.m, params2var.m, params2varcon.m, var2params.m, str2vec.m

FitDemo.m - raw fit/fitcon tutorial script
- Dependencies: rosenbrock.n

---

# Contributors

Creator: Geoffrey Boynton - @gboynton - gboynton@uw.edu

Ione Fine - @ionefine - ionefine@uw.edu

Kelly Chang - @kellychang4 - kchang4@uw.edu