## UW Toolbox 

This is a work in progress, more functions / folders will be added as they have been tested and are functional.

Kelly is currently in charge of organizing this toolbox, so email her if you have questions!

---

# tutorials

Collection HTML rendered tutorials for various implementations of toolbox scripts.

[misc](http://htmlpreview.github.io/?https://github.com/VisCog/UWToolbox/blob/master/tutorials/misc/MiscDemo.html)

[optimization](http://htmlpreview.github.io/?https://github.com/VisCog/UWToolbox/blob/master/tutorials/optimization/FitDemo.html)

[plotting](http://htmlpreview.github.io/?https://github.com/VisCog/UWToolbox/blob/master/tutorials/plotting/PlotDemo.html)

stimulus (WIP)

---

# misc

[nansem.m](https://github.com/VisCog/UWToolbox/blob/master/misc/nansem.m) -  Calculates the standard error of the mean while ignoring NaNs.

[rmspace.m](https://github.com/VisCog/UWToolbox/blob/master/misc/rmspace.m) - Removes all whitespace in a string or a cell array.

[timeLeftBar.m](https://github.com/VisCog/UWToolbox/blob/master/misc/timeLeftBar.m) -  Creates and displays a real time based wait bar (instead of progress based).

[translateTime.m](https://github.com/VisCog/UWToolbox/blob/master/misc/translateTime.m) -  Implements the [Workman Translating Time Model](http://www.translatingtime.net/) to translate time across species

[xls2struct.m](https://github.com/VisCog/UWToolbox/blob/master/misc/xls2struct.m) -  Reads Microsoft Excel spreadsheet and returns a structure with fields that were the headers of the data or creates headers for the data
- Example file: [xls2structExample.xlsx](https://github.com/VisCog/UWToolbox/blob/master/misc/xls2structExample.xlsx)

[MiscDemo.m](https://github.com/VisCog/UWToolbox/blob/master/misc/MiscDemo.m) - raw misc folder tutorial script

---

# optimization

[fit.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/fit.m) - Helpful interface to MATLAB's 'fminsearch' function. Performs a non-linear minimization algorithm.

[fitcon.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/fitcon.m) - Helpful interface to MATLAB's 'fmincon' function. Performs a non-linear minimization algorithm within specified constrained boundaries. If problem does not require constraints, use [fit.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/fit.m) for efficiency.

Support Function / Dependencies:
- [fitFunction.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/fitFunction.m), [params2var.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/params2var.m), [params2varcon.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/params2varcon.m), [var2params.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/var2params.m), [str2vec.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/str2vec.m)

[FitDemo.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/FitDemo.m) - raw fit/fitcon tutorial script
- Dependencies: [rosenbrock.m](https://github.com/VisCog/UWToolbox/blob/master/optimization/rosenbrock.m)

---

# plotting

[logx2raw.m](https://github.com/VisCog/UWToolbox/blob/master/plotting/logx2raw.m) - Converts X-axis labels from log to raw values.
[logy2raw.m](https://github.com/VisCog/UWToolbox/blob/master/plotting/logy2raw.m) - Converts Y-axis labels from log to raw values.

[widen.m](https://github.com/VisCog/UWToolbox/blob/master/plotting/widen.m) - Speads x-axis limits. Designed to pull extreme data points off of the horizontal axes.

[subp.m](https://github.com/VisCog/UWToolbox/blob/master/plotting/subp.m) - Breaks the Figure window into an m-by-n matrix of small axes, selects the p-th axes for the current plot with spacing padding around the axes, and returns the axes handle. A variant of MATLAB's subplot.m but with tighter spacing.

[tile.m](https://github.com/VisCog/UWToolbox/blob/master/plotting/tile.m) - Tiles MATLAB figures in the monitor in rows starting at the top-left.

[PlotDemo.m](https://github.com/VisCog/UWToolbox/blob/master/plotting/PlotDemo.m) - raw plotting tutorial script

---

# stimulus

[OpenWindow.m](https://github.com/VisCog/UWToolbox/blob/master/stimulus/OpenWindow.m) - Calls the Psychtoolbox command Screen('OpenWindow') using a structure convention.

[DrawFixation.m](https://github.com/VisCog/UWToolbox/blob/master/stimulus/DrawFixation.m)
 - Draws a fixation point (smaller square inside a larger square) in the center of the screen.

[angle2pix.m](https://github.com/VisCog/UWToolbox/blob/master/stimulus/angle2pix.m) - Converts visual angles in degrees to pixels.
[pix2angle.m](https://github.com/VisCog/UWToolbox/blob/master/stimulus/pix2angle.m) - Converts monitor pixels into degrees of visual angle.

[sec2frame.m](https://github.com/VisCog/UWToolbox/blob/master/stimulus/sec2frame.m) - Converts time in seconds to frames.
[frame2sec.m](https://github.com/VisCog/UWToolbox/blob/master/stimulus/frame2sec.m) - Converts number of frames to time in seconds.

[waitTill.m](https://github.com/VisCog/UWToolbox/blob/master/stimulus/waitTill.m) - Waits for a specified amount of time from a starting time. Returns the keys and reaction time pressed during the waiting period.
[wait4key.m](https://githubcom/VisCog/UWToolbox/blob/master/stimulus/wait4key.m) - Waits for the any specified 'keys' to be pressed.

---

# Contributors

Creator: Geoffrey Boynton - @gboynton - gboynton@uw.edu

Ione Fine - @ionefine - ionefine@uw.edu

Kelly Chang - @kellychang4 - kchang4@uw.edu